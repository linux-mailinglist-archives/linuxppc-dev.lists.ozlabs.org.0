Return-Path: <linuxppc-dev+bounces-8368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C20DAAD5C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 08:14:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZslMW6Q16z2yMD;
	Wed,  7 May 2025 16:13:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746598439;
	cv=none; b=lutulplBOdmChaWA1vB/d1HJdPKcUsuzSSUxz7Xyz5mRCGtWUXvQcXIomLi60jhNLmUENm+rde8OeiZNc5xrnmMMB7pmV1vlZgBPljV7ZZ9BZDwfU6LpDYCkPz8hGEj1v04cu7n1H6Q1dTQxfL0iA2w3+D77f/ujxTINls7p9oMug/+5t/3QA36cU7cXNw06vJ/SDVC6JCBeULyTdEwi9M9Tm27PWsz6IIhFbBgA+86arF6i/AvzbsrQxrms6ipEh+dKDYmU9iW6vmyTWED/5BRvs9lMG/whqwCrKuHNT9uusX62cicfPzMp+lGoPmz7gl7TQeAajzwCtP5okI/pRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746598439; c=relaxed/relaxed;
	bh=LJDoQSeXwT5ngJPzWMB/K4sy4nXrJNfhpKUqA7OjnfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dydn0nU+/7B8VgX8ZNTYOhXddE/BnHUCtzg5x32LPCTQaCh0QfAv7fMSVQkrtBIpuQWsjUoBZ3WQNpIeCwU4GZyEl+UvdIEzoblKgNSOkBFXZGv2FiDwLZlduBqE53YD2XQYpetKehtEjQ/3pcffglEDIWRNXiTpxZ7Uiw3UjimwyctJhcxhaVmzcWzfI1SA7w8coilRwjqpPQBg77kYFnQD5xzKnDiUPwOIfXaSMtj7D7uv2rH4iZyYS4Mv6Qh41z0VhQSBkwqgRAcZDG2ZNqECnPppyZ3FpxIDMub7zaputgCdb+Pu4iLGQll/gz+GYOy++qeRxQ3SZ98xCida/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TxB9Cm0z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TxB9Cm0z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZslMV1v6fz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 16:13:57 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-306b78ae2d1so5874350a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 May 2025 23:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598435; x=1747203235; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJDoQSeXwT5ngJPzWMB/K4sy4nXrJNfhpKUqA7OjnfM=;
        b=TxB9Cm0z6PjNqsYA9CB3KJxh2kvJgez5TFs7pXkJK7Th93sW3kPaE9mxKjsYyLw3t2
         MR9/FENNS3UJdWIsp7Zkn4Mg3TiMW9CgTUYBItsg8ShEt7hvl7RhCBr7yg1vvolC8Fz0
         mL/KzXhrlSMPWuRAvqz5T7J5O/Qi8Wb7VS5z/fAmNHjAZAZsULwvWSgL/UUN5PGht71G
         Ezt7ediJVj0OU3P1SVhScTjqT5yKZ1hC3wi4qJJUHZtYa77SRAlKrrTVSvWft4S9X0Yb
         fhj/Q0lW5dH1+0ydbELlU99tDAmpg9Wv5mRJLI/8Jd0hcCIFVa8oL/XmatvJD+MSuvjx
         ufEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598435; x=1747203235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJDoQSeXwT5ngJPzWMB/K4sy4nXrJNfhpKUqA7OjnfM=;
        b=gcdH8YGH/00jUx2iQRyrfFtKRruVhqINLut06CFIV5OnHhZleLz/e1qxQxDvTFwaSO
         kU8sZkcOfZDsznagMeV3HYLMwZmSuO82Z0QPnJqEGUQXAlX9fv59axiKFT42huPV61Pb
         2NDyXrTzwdNXw9SuAQP6ngExMdaheHpZyJY7FwwdNIuVvoJjhk93H4RkBiCSvFSHYeoZ
         SR1nSdhQ+ACW136tIxW4jZ1a1WHusGcqbWVkJwWWEbJXv18d9WkavKvS2zTcMHccjaxr
         6uRFccTftOLGRmmlFPyRCzMGGt6nJna4fvz5vrS00hCKHxuMZiIYJ5PZsv+kc1rdfRZA
         p7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVzexVb5Pu1IkrBAEMxAb7RZwtQ2jJr9rIOCkq56ucDoFknSqQUViLLoQWSnyjkdXlbI8dZpGZWyQ0kLXM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyIirVtZVO7ViOOWvNjUft9V+3K5J2PtcHkPRi/Og8UsiN2bKFQ
	1p3SbFq4xt6SsVnlLtW3/ibFC0lIJm1AITgQPoazP5DDmzooXQiW
X-Gm-Gg: ASbGncuK92hJKXws2gwWvb6oNcydEKlSBrmLC9jTaZ9yJ01Iqpc6l73pncaw0UbUBQ6
	qzfbUIt2O9yCcnWsBA7/MIDiOAF9RUuHP2Hz6RT/z1mby87mNpjlns5W5z2bpJV4GREpXsG04sr
	9GugSjTWZ1g0hJs4j8DzkJdFwWRSGqBAQSk/F2SE6FTDkqZ8f94v17A2gMePlRqeyBUEGwXwU17
	PyX93A74IdqjTm4t1qPZd8UnSekQBrsQJjCpgY2EvvE0g+Fs8KwB2RbYlFTo4WbYVyhB3V3s1r4
	bF63YV1vUmH4QFyeE2sC2i1a+Wpuy2kEf7UeW1ae
X-Google-Smtp-Source: AGHT+IFPRruQw4GtiAof5cXfix++wFVrArlzpdig8lOjG2DCP6NDOoXTGHN1ebuVPvzTx7lJR9wbrA==
X-Received: by 2002:a17:90b:3e89:b0:2fe:ba7f:8032 with SMTP id 98e67ed59e1d1-30aac19b5fbmr3555708a91.9.1746598434806;
        Tue, 06 May 2025 23:13:54 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aaec2c384sm1062507a91.46.2025.05.06.23.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:13:53 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 95EC5423E4D9; Wed, 07 May 2025 13:13:51 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Richard Cochran <richardcochran@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>
Subject: [PATCH 0/3] ioctl numbers list cleanup 
Date: Wed,  7 May 2025 13:13:00 +0700
Message-ID: <20250507061302.25219-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=803; i=bagasdotme@gmail.com; h=from:subject; bh=YnUsldGaNeop6ZU8a+PZWGnLxriRPuTvgJ4+EEwCDBI=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlSP9iFPjnO2BCsfU49fYVZ47uriR1PlFZ3/PPyY7vVM NnrWwBPRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACaSM5vhf9zdV/NSdn0x+Ci5 4nLkwVDBuoO7VPrvrZjwddEF+xOK2y8zMry0vvp7vr9KkV+b9adMCd43Ott4RB9Wn790c+25Ezf WvmIGAA==
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haren, Hi Maddy,

Here is the cleanup series following up from 03c9d1a5a30d93 ("Documentation:
Fix description format for powerpc RTAS ioctls"). The end result should be the
same as my previous fixup patch [1].

Enjoy!

[1]: https://lore.kernel.org/linuxppc-dev/20250429130524.33587-2-bagasdotme@gmail.com/

Bagas Sanjaya (3):
  Documentation: ioctl-number: Fix linuxppc-dev mailto link
  Documentation: ioctl-number: Extend "Include File" column width
  Documentation: ioctl-number: Correct full path to
    papr-physical-attestation.h

 .../userspace-api/ioctl/ioctl-number.rst      | 512 +++++++++---------
 1 file changed, 256 insertions(+), 256 deletions(-)


base-commit: 03c9d1a5a30d93bff31b4eb0a52f030b4c7f73ea
-- 
An old man doll... just what I always wanted! - Clara


