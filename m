Return-Path: <linuxppc-dev+bounces-4636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD85A009DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 14:20:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPkjB5mXfz30MM;
	Sat,  4 Jan 2025 00:20:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735910446;
	cv=none; b=FGVt1xHIjB5g3EYRkxLcxnDEw0NOWJvjGO90e1JwNgj3rbtUNm7PaHju47bptAdNwnopmSBQADIZHjuFkJAdYx/Klt9lPP6WFVvSHP9u16KjYZO2+OqMUqJpU8oLJVbr6adAjZgL/qmPHAXz6SsMD4SExX7FaABQxnr+8Bpmmfbl7Xl5eRGZKjMk98oq0Xc10QyV5nZdq+74WgRc8odClBf7mH0gK2o+APvhIONYYak96vdCeggBAug3KFBh31mmfGJckNJ5HD3lv2EzJ+9aw/qpYW64Lzk34Bqa1gCiNPKYDDSVaBVaatZYl+4i3Ia4feJTzMSdneyinQCGIitO5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735910446; c=relaxed/relaxed;
	bh=/W06P7Yap9ayunUulBu82k8vn3ugY5M1/I3mLHIlNQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O4gwE7xjZHaexK8KBs/JLp074+Qwz/9ydM5h+PO1PmO6VBNkl38Q2blkAQdjB3c7uuzj/id3Jy7Bp/8WVyntWRZEAkQnI4dnUwpjMxLt0IxcMEnS4c8ci3b1gP9zsUgeODUYH0do4WtFLWeEfBe8OlwJQpjiWr8VuMI6Iq1iacRdYwa789GCVxN6iTx2j5Go+MaYcRajC5Nkm4LdoPn0SE52crIa7bbG0sgTyBB5GFFb2MfwxMyNayZn9hkMNxAwZckTsXipZXvGIaIY3UGKGKsZek2R2Qv/tw/UhgjQRNGClDEIMFM6xfKtpkthUNfT1NynCF0/HsyC0Cg4m6m1UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iKWpe/Lg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iKWpe/Lg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=evepolonium@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPkj85l73z2xWt
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 00:20:43 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21675fd60feso224382515ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735910441; x=1736515241; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/W06P7Yap9ayunUulBu82k8vn3ugY5M1/I3mLHIlNQI=;
        b=iKWpe/LgFOPz5VrmjykugsdzH+C1bJcsPzW1POIQaGuy8Q5nwwGLhJAk7ZuDgSP8Uk
         +KaKsQMObV/dlURSA/d8ZsHk7z/MNjBznTsgtPKTj/rrXzEBUrGhINdMjE3IMmOAWkHD
         tXpl/HAzv/iweIu9bRmnEG31xH8SIoaXu24IHC75XxfmZf9Ofqd1Lf+u3Rm4IsFPdRl3
         OZ3Net/HvmCvbiq8Jb7ifgfnfJx3YHC/mrRPvQZF5D/6eikmTUTpjlUEtKuaubKx/hEq
         Z8i7+vmCz8OZJ9XNPRVDfSwVWW3PBjxYj/a0FqM0VXdj9RY1bpoiO/oEw/QS68JrrXcP
         6IIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735910441; x=1736515241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/W06P7Yap9ayunUulBu82k8vn3ugY5M1/I3mLHIlNQI=;
        b=cYXz49/hVb+Sm8DsJ4s8x6AXgItjjwOFQHhkgqw1QxE1k3MMibbSdhy5SbLAnCtkNp
         7rhjTj7NbKjJuUZXGTaRWRw7zRKk+/2meTVqGB1CSebg0rnIQ0hUF9S+B3TXBl43+7AE
         uHPrsvmABWzasjY8/z9Z7iWFlApqtjViNQ3U069xsGhTqbZqNBBtxASbM0MLGias/rTL
         uBxYqHZ/z4vFA4kja49yyPRE4nkwgBcwgPiP9OJZKxjMrNL8xU6qjS1hNGylarAgpPz5
         a/5883G4BxRnZLzk0wx7K39zyHI/zwhRjK9ikC2Br/bInw6HPmJjTdnu8OPTL3Me8ZKq
         NvLA==
X-Forwarded-Encrypted: i=1; AJvYcCU6IrxNb0cSKDPeuGFpd3YnGFddm2/P9Hudz743bJ5dG1xWP6ubg5aQ1YY2fG43lWnISi/GQzX4lsUK9Ds=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNPRvH6KDE55H3KLjhohXPaZjoSaJu46TZSUUzHk4N6B6oCiou
	OyzUFc1p1YJVs68vgtY4M52Yvm8nW4gnDjesU34BVDIerOu0tJXW
X-Gm-Gg: ASbGnctMPwoB0n4png4yqzf0UCwFQj1op5Rr4HsYssbppzF9EhSela6pugWAFR4RAyH
	BDlRkUcTrERyXNpJBzaH8T33TXYIcyvLsDxTk3QQlogZWCJGKUNzUgEwL9n+Fv0sk06ze/X84zM
	fQ7exAlIfgsREtH+am6yRHr3k+aKRas6Ow94+NEonxefb1Rx/DcSCSn1CwS3Bdv3GwFHbPgpCqu
	rhHLB5ixsvI7Jr3evY6pqwCwOJdN6aKv0BhVNvLwVbhNB8t2cMwKnIJA13iZgnxsq+bqIf6yMg=
X-Google-Smtp-Source: AGHT+IHwExdimclmMSKacLQ/hGjwUiFfHmTo6c6idhsY3kVPOan85IX/4u7Qvp+eCIm8FUdgIGDBCg==
X-Received: by 2002:a17:902:d2ca:b0:216:393b:23e9 with SMTP id d9443c01a7336-219e6ea1b9fmr542337925ad.20.1735910440998;
        Fri, 03 Jan 2025 05:20:40 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c80:72c5:3bab:4abc:8bf1:8fb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97181fsm242842355ad.108.2025.01.03.05.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 05:20:40 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: evepolonium@gmail.com
Cc: bhelgaas@google.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com
Subject: [PATCH] PCI/AER:Add error message when unable to handle additional devices
Date: Fri,  3 Jan 2025 18:50:35 +0530
Message-Id: <20250103132035.1653-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241227071910.1719-1-evepolonium@gmail.com>
References: <20241227071910.1719-1-evepolonium@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

i completed the todo on line 886 thats why

