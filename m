Return-Path: <linuxppc-dev+bounces-10235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34BB03441
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jul 2025 03:57:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bgQSK0xYhz3bm3;
	Mon, 14 Jul 2025 11:57:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752458257;
	cv=none; b=URu74EtdVTQPgpd/wBqbDtxwunvB4qCdkzMgLEcFQ9QlvLt97CRYeoPw9l0SSivPdpph/7a04XtPE870rbWFVTFYBJj3BqL8mXLH2etrp0ctH7P/xzRPyhPnengSizxd8scnTQwNlfw/PhVV9cs7S4bQQEx/OnkMNqYd2EHJy2htnfIfpxR9Cbg/i7utq9jNaeNgqOg2TECNtz8SUDWINla/lzaKrWM7roGLoeJE58CuIEZ3eXMzEzerxMQC4VpBa+KuRkCH9MW3Nh/HmEreOgp89BkdTDY/o0kLz/av/+y5WQKYsYkRCDEJSwbtDdkJm3UyfHSZhuiel66zDbv4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752458257; c=relaxed/relaxed;
	bh=G8LBFqVjLhKB/rrOkLWdjE91pXMr5HHe2wnD4KcukNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l97JebO4HT3OxaFn58HbAQla24sJge13CSOs08AYNEA0MOLEXfshuUOxAv+WxgEQ798bEP299DsHmgkpy1IOQAk9nU/+bWGI2eOftSSzuPjyk3OTA75QPS+VYRXcRVwjs0yj8G/cZXLUYT+Yh2GsgSKeji7lTMbLgAOnwDniYpncSfMkl8yzTm0wbvO5XB1Boiz4XP+n4BMEGKaPIzu/pdxk1k9oL1hW82/Tnxp5ybO5xndcL7JLc9wUznnori3+rtB0EqlGhn/s2+rLFVvya/dEGtDSoJcqkABA+rcbKmt2LZF/VvfMh3oIaVi7VvxBtgW/hyP0NVc5JyC318U7MA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QN/vjRro; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QN/vjRro;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bgQSH70Vvz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jul 2025 11:57:35 +1000 (AEST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so759523166b.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 18:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752458252; x=1753063052; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8LBFqVjLhKB/rrOkLWdjE91pXMr5HHe2wnD4KcukNE=;
        b=QN/vjRroSnFN2ALrEkJ8EXOFryPuzwOzUoFD5bx+KQCHdfKe+hkAXiwBjoysJ97z+k
         gApNBL4wM7enQXkT0LMCqL/Vl8KGcpEoOnLfUCbIH+M+2EtgX4ef2rqdj0hhYjE3G10v
         Z8bvvMMyaPsz5JPU/DYvv0RF+PrjUUBv948Emhr5UX60rRAZ37vON027ssR+LPIQkhNX
         KWZIz1hFeKbJcllzbUEkX1XnuAlSBUugLw9O30BzgpFfZRgfhQLidAeH/xaafUUNTghc
         kPfFr5Yz6a/Y1JBtbqph43boyFkkB/mJB4wkV1Sf/7886GuLOkAIXMkyFLJcP1SjzeEr
         sQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752458252; x=1753063052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8LBFqVjLhKB/rrOkLWdjE91pXMr5HHe2wnD4KcukNE=;
        b=GD4XT+mN3DEte3I4i3QosMkSO0DvarF4C1/l8dSzxgCMvvs6OHR04EnslzkRc7FC7X
         t2eIsjK4Xy9bsTpygklhWSEB0ZwQmMC/GDWjMTuxcU0eOZoHiRanOUIIGlhsI/kEKkPZ
         rkkY8VGuEBq+P/ZHFfFTrmdhoKi8pKXpyaRkLN4DX85McX+UxJC8mEgJe+akN3PAlUiL
         DzCTQspih3LIYELgpqgVfEYbo8t+814GpieY0Y4lXp+3tj4x350pxinpImpiVYTBuJgb
         mqy1J0trU4C6nHsgywHnOPenzUkOzaTNHqtLqGP5wsXOMF7oBmhKRX+5HaIMj/UfWGI+
         AXRg==
X-Forwarded-Encrypted: i=1; AJvYcCWGwB3IbwBL59ge6u8yDkYjYjRRc+sIBJQROj6ef7CJcL/RZXQy6zlKbt8OwoSJlUFK9ACCPm/0mj/7zTg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyup3xU+zUhGysez5zvod19eQiPIqAZL3CnZG95L1R9hbjycuTU
	s6loPL673KmSptTxKzW//Id1awTZkYCoLbNZuVlK3R/+HYNEgLrEN7mf
X-Gm-Gg: ASbGncvjC5+WRgAJs6qGnsLKSiDXCDJ1nAvzwDFyIOtxE69Lr/sUA88oUlhb2+vddbH
	FMYT76/nOPfzk/B5VUgDSNwx4kqeeimiM5gINjXtSvS/lPam2eNrzap5Of2Db1QFXp1GsvG2WWB
	A8i76JN0oBBLt7zLwZA7LLuJj0w5+qLeyDlF+YGIRXQpKsHlwTTKHSkDMYBFWANdaUGu0JYNsaF
	b4zIL748uJilx7N2yF1SIQvwbQnE9K9aZ1hsyw2KO69j5wPN3by51ilSxVEPZPYhePOxrvkbOoX
	YqNFfsoHNS+Zn922xMChGDBqYhbWonwR24++D8OeMy3ridPQYSZz8rd3PBjKmHezVAMXTzqqIb6
	ZpQsC8yH6f/i7NV62WHQkRW84R0n6IEyj
X-Google-Smtp-Source: AGHT+IGmgIuCRL7RTUjPKjOceujeeWJzHq3mfEJ8vB+TPCTqr1FpZH6XatXdtf3E0P66B3n4E72FoQ==
X-Received: by 2002:a17:907:f1cb:b0:ae3:a71d:1984 with SMTP id a640c23a62f3a-ae6fc200bc2mr1213901466b.57.1752458252215;
        Sun, 13 Jul 2025 18:57:32 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7eeae5fsm741704266b.64.2025.07.13.18.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:57:31 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 26369420A817; Mon, 14 Jul 2025 08:57:25 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>
Subject: [PATCH v2 0/3] ioctl numbers list cleanup for papr-physical-attestation.h
Date: Mon, 14 Jul 2025 08:57:07 +0700
Message-ID: <20250714015711.14525-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=bagasdotme@gmail.com; h=from:subject; bh=nshxwRS/+UyxHkQOYE9Fk36v0JMlpdCU+qxIFnNJs3k=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBklSenbP7s6TY77w/Zxcfnc8LP7VJes4kp6vF0q88g27 d0bNG8HdJSyMIhxMciKKbJMSuRrOr3LSORC+1pHmDmsTCBDGLg4BWAiNvcZ/imW9x55t+FFW8yN UDfZ/t8xE2e9vrBgT9TpyTkNPX/Nvu9h+O9ssn1pdt7N/elHOB+aaz52Xjdxn1pm2e8DZ9Sktjn k3+QFAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

This is the cleanup series following up from 03c9d1a5a30d93 ("Documentation:
Fix description format for powerpc RTAS ioctls"). It is based on docs-next
tree. The end result should be the same as my previous fixup patch [1].

Enjoy!

Changes since v1 (RESEND) [2]:

  * Add Fixes: and Reviewed-by: trailers (Haren)
  * Expand tabs for uapi/misc/amd-apml.h to match other entries

Jon: Would you like to apply this series on docs-next or should powerpc
folks handle it?

[1]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/lkml/20250708004334.15861-1-bagasdotme@gmail.com/

Bagas Sanjaya (3):
  Documentation: ioctl-number: Fix linuxppc-dev mailto link
  Documentation: ioctl-number: Extend "Include File" column width
  Documentation: ioctl-number: Correct full path to
    papr-physical-attestation.h

 .../userspace-api/ioctl/ioctl-number.rst      | 516 +++++++++---------
 1 file changed, 258 insertions(+), 258 deletions(-)


base-commit: f55b3ca3cf1d1652c4b3481b671940461331d69f
-- 
An old man doll... just what I always wanted! - Clara


