Return-Path: <linuxppc-dev+bounces-11034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11088B26F81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 21:09:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2vty6279z3bcj;
	Fri, 15 Aug 2025 05:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755198586;
	cv=none; b=lo6AW/8I7MNrac91YglK9IrwEizex0PykuwxycWraOuMe7gKD5PLBwdSRSWznnBpOkTWoH6yDKZUQunMj2a3c+oLKP7pDa+2NevHEKl5Zh0vXTu71DxpBE/VJSLiKzGdXS9StXHsl9y2nuH9KH8fAFDT/Ja2numoxU2G5muR9AdIHTIueUv9WmPlJwlPv9kFAqWs2Fq7XzoDo4+sJ9v4Z3ozerBbq51IvgTPMFibpUlz8oK75oFOKbT6k0vRNs13Yrg/J1Ktn2H+HGRwF4lvUv9E50UrVpTpy0xEsM8mJWay0yoh45ZVwtCxVsCP4ZM0Y/zB2oq3U/CRMZ4sVhaicw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755198586; c=relaxed/relaxed;
	bh=OEjnFUI1OWJiYFgFirOakE5jC0jpwBgJAeHvFVm1J5w=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=NWG0n+LcXdIE1Tgc+V5bzEUHWJ8nPKvn54kxoahF/Hqic2fGdrmqdhwx4xef1GXJ8Y0Zm6UCzMmGDeJMmxQugmZnKJNgCFIFP5jRpNNkMNOr3gGTEiWY6fhd8uYdnwVZ5Wpo/c5uMZzwx9pwTX7MIMSAXVJp1hTA/JUFgOEbu3FwjZP7RAgBKbRq/DJw4WbhlVOYyt7Mh37lpYHwhq9fEgScEJ+XN1hTp9KooP+3mN0qzGXcGzG2uiGp0X5envf+1jG7sn0fyvIXKM5Nd5YL2FUHK6PS+QR3Ktb3xh7dOyY6GAoTxUJ9rN4ydncxlXX1xBjJg5N4M3v5t0mzkJzUmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OylRjxvF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OylRjxvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2vtx3N8Nz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Aug 2025 05:09:44 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-76e2ea79219so1557837b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755198580; x=1755803380; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEjnFUI1OWJiYFgFirOakE5jC0jpwBgJAeHvFVm1J5w=;
        b=OylRjxvFHhhV+haKGlyXzFOTIz/0WrCUSOLMdEl4XU6RNMabTUXmNhRWNcyrAIljGD
         n33EoMwzupkPIMh168R1jw8KqN/MqxJzXn2R97++ezZysf2HQjq6Kd9qIfaXxJmJuxHh
         lNVZvQ/mC8fVdNfm5E6C2QJ+0xIZ2u+KuxnbfnMwbQLKZEQ6PU7/AvgUGlbReKXrc8Vh
         YyzxX1IjkoT09mKDdfbRCqsD8OoiT3+n65DIjG46oAvET0ifx1rTreBGVLgeUQ97Yop4
         nCCTKNwxzNUMGUQRgnVJIKwBQ/NnDdnjtI4eRK6adMqBdOdK2KExCM+DV/6Sh8TS1vPL
         PZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755198580; x=1755803380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEjnFUI1OWJiYFgFirOakE5jC0jpwBgJAeHvFVm1J5w=;
        b=ZQL3XaAeyZWph2NgNigDpZQK1K64NcjcBTAy77wp0sDtEErR+rbUvLD+xX8wbElA7O
         2Pdnd9UN+3ccAehdMxwrjqes7uH7IkUdTd/yDfs7NEvAUTbew2l5POpmjLzMcxJ1tphx
         2+yLeGxKj5tlopuE+jzn1FJAU+coKQq3SZFsIDLU2aSEtcib2FEdyd7S1QjtzyqZDZJj
         pNPQU2oU5avSIE50wli0XepASbwOYtxXT4AFvtlAsSVACPz2wD3rAMkCA/u/SDInQepa
         LtxP8SE0OqaXV8v8HkoD1TNBQDlj6k9LdD3OyCj9CpPk6swrnCbIN7a7ggevSnK+WPG5
         tmeA==
X-Forwarded-Encrypted: i=1; AJvYcCWG1MwGmo1qyjKKIMn8wkBKIF8pi+Jgrs/tpsyw2peAkosxoMbAlyhcqV6DlmxtDtBjHAKUeDoSVQrjhTs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDHPW6yBM+1BEbLvS9lOBn8h5JvAlM6gDKHINj5z5eBrsryn9+
	f0kBBXzwHcOHgMLUidZFv75su35I769rGs2g7rzNKjwRIiXWGv44s+sB
X-Gm-Gg: ASbGncufuKFcWHU/KQuBd52P6GFbUErZIVs30Kpc/eY6yzEE30qC05NUUT7YYLIfsR5
	ppwxtyygnjdpa/wbFLq1PBdsF0RVxGfZX7uUPSV4GlmmSzn5TYNhz1Iw1Tw2E7WKGZkbbxF7bRY
	GFJ1mGwVBVnIZfem27xahS84ueu7GlqOrW9oWOXZLgRLp1J51UCAaJcyLlpB+7BpTrLhj/yCJTG
	Fbz3kracDL/Do4iPGmLekljQExWU7CkUaW+N5PJ6BYRcXeeCQJZp8ti4j2RRdCpVARbSWb7R9jD
	RVRYjDNjz7++PR6hCWgva6X0UVHSzxMAWc3wUhS+qSjwWkycbVHx3vggm8oi4WDIAYGpBPgHdpD
	7VXweLkVSA0EQ5oYhOmsEHQ==
X-Google-Smtp-Source: AGHT+IE+0R8hlzof8m9PTZ8eJ4++ekq0pQ9jTHSvihFazWvHoo7zDXSu7TPbpDxldz8fdKJk1QmaKQ==
X-Received: by 2002:a05:6a20:432a:b0:224:c067:66f8 with SMTP id adf61e73a8af0-240bd282706mr6776227637.37.1755198580291;
        Thu, 14 Aug 2025 12:09:40 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bd7887522sm34144602b3a.20.2025.08.14.12.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 12:09:39 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Yury Norov <yury.norov@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] powerpc: pci-ioda: Rework pnv_ioda_pick_m64_pe()
Date: Thu, 14 Aug 2025 15:09:34 -0400
Message-ID: <20250814190936.381346-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use cleanup functionality and better bitmap API in the function

v1: https://lore.kernel.org/all/20250720010552.427903-1-yury.norov@gmail.com/
v2: https://lore.kernel.org/all/20250811165130.37552-1-yury.norov@gmail.com/
v3:
 - use bitmap_zalloc in #1 (Andrew);

Yury Norov (NVIDIA) (2):
  powerpc: pci-ioda: use bitmap_alloc() in pnv_ioda_pick_m64_pe()
  powerpc: pci-ioda: Optimize pnv_ioda_pick_m64_pe()

 arch/powerpc/platforms/powernv/pci-ioda.c | 27 +++++++----------------
 1 file changed, 8 insertions(+), 19 deletions(-)

-- 
2.43.0


