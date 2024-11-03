Return-Path: <linuxppc-dev+bounces-2792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CC9BA801
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Nov 2024 21:42:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhRNn003xz2xGl;
	Mon,  4 Nov 2024 07:42:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=43.155.80.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730641143;
	cv=none; b=M9y/omAT80ne1jd8NgggK5fzQ3zQBSL2rQL/T7tMtqpUu2wv6TrVzyOhTqjhQBFgMSl70pVenY/YAj5E+qWbAF0L4SqBmddU4rLGmbHkPVlvY53zWSKyIaEdYpBMCDsoLOMGaDN9O8ztoLo9RNnYSyRatek49bz87abtv0ptAOynA6zEpr6tYQKgYX5B0Up8UsMHNRoqrqGP3TGrg7naT/ZErF3s5PUk/coh7jzGlnfOl34Fpm11rMou8ju9q9Mz2Z+0F6UTJk5eYMj3BHV4IrH1zRQInDICpafnH8ACBUHq8KhEst0mbJh0n3YBCcuqPqVP/k4WWZUbWouhca3Vlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730641143; c=relaxed/relaxed;
	bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b4TEB8dWS2vpJ0pY81mjRESiuJMviqIBcvK5Q/oJHUGLOJfj+cE5dreMyPug8ly4YetO43L0ZA3pzqe0EPlSuf4LcoliXPa+1U+M5gk3vePblYtLLjc4GimR2AI4czJZ0f6GUSWstv+vKwk/79q7RdppFti2hC5gDBILJJuLqJYAepbBCW5RkNBwmaASwlBrhcWcQmYVSxhlEauIiV3TrR0rlmIxYuFTTczhThu5KGxvdZ12nQy7TRdMHkgTA/pFA8LL6hTltzFH7lr9sCSCjSKks7ve1o2Xe37pzN8A8PGzUpoeFyHa7986AdGpeG/sC2l8tD+YyCX64ToAWyAPYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=KLF8HuA2; dkim-atps=neutral; spf=pass (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=wangyuli@uniontech.com; receiver=lists.ozlabs.org) smtp.mailfrom=uniontech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=KLF8HuA2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=uniontech.com (client-ip=43.155.80.173; helo=bg5.exmail.qq.com; envelope-from=wangyuli@uniontech.com; receiver=lists.ozlabs.org)
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.155.80.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhG0N4qjDz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 00:39:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730641022;
	bh=0u2qY5VmW02QoZQQ8PVGB0RvEt+gYfighmeowfpBp9Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=KLF8HuA2XZZA8PyiFIvxZyWe/QyPFXt7v/I0izyxgFtQDYw727X9/PTsC+BZn74Y0
	 mWRYJkxiA6zPS+DHh2CYqTkCl6rOZpFl9M65nsnUxXhTKvCMjUxLR4CJ4QUZsLa+Ci
	 r1taA2f3NHlHgNNy0bmBr+6w+ezN9xazZzSxWx9w=
X-QQ-mid: bizesmtpip2t1730641018t4vihmk
X-QQ-Originating-IP: OJFfFUb+TagDtWAwy6uc0+sLCBe0njxsmdHE22f+THA=
Received: from avenger-OMEN-by-HP-Gaming-Lapto ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 03 Nov 2024 21:36:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16809586154877906677
From: WangYuli <wangyuli@uniontech.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	kernel@xen0n.name,
	chenhuacai@kernel.org,
	xry111@xry111.site,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 06/18] loongarch/crc32: expose CRC32 functions through lib
Date: Sun,  3 Nov 2024 21:36:55 +0800
Message-ID: <DA8BCDFFEACDA1C6+20241103133655.217375-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241025191454.72616-7-ebiggers@kernel.org>
References: <20241025191454.72616-7-ebiggers@kernel.org>
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
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N6YgFB7a9ocC3pQJxWcp7+Xrliways2mu9o23knf3Akmh/U/46tifWDD
	Zmtnw9LJxsopTQbaWubtG2dud51nf2xYcha4+Y69C4C+471DwmOCqpoN4zAxO47wDQV70EZ
	NB803/RTtOafS5LsEhSa2pXT/Pm7oip6cyqFoW2d4vF6i4qRl8uYTDzWiPcWi4I7LnVqYol
	BpRoSEkl96raCfa8axlwSr+Opdc1J1kd/dHhlgucsXsEQSWLrUzY32rUWk6i5P+scqQkVIK
	jaY3bibsRScpv8SvXBr7qp630Y3JCBCkyKJHLRkuKPcUcMUvpxBqGThWo0h6lFeNDWD4QLR
	p3aME94npPL6RcZXYKUvVa7VWjLkvLkIvBgSFWr+i7DjY+GO4CL9qTmD1mUtq0/dY4MMoZ9
	pU+PF4eXaZUg1JW7idWVj+tMR8BvxgXJkoGHXZAldv0sDMxeJbWWoxEz1NL9d+6WFkZQnYC
	ObfHL/lbp9IyRiliBfTys5F3EZq/NIDMu/GTJri6lKmIVwC/jNbP70A/MHHO+b7OgOdQEDE
	9cos+lNIZ9Dw86cxmAU8H4QV6jITKpPTMPcPao/Dd3X1c3EZM5Vu6Yad56RlKep0ijS7HXT
	/4+f3kTvpruvd/R9i9NH68vhmH4i2VHf+6Vt4d0ZkzZc6kpLIrPImsVVxDncJ0dujKtt8EG
	Ki3aXDVoVBnRBauPb2KMM9UlcpXqpcciSqMuYccju7lsz5RQBGFivjwxVU56aMjBKuLv/fr
	yVLwCCcyGGoiQvaS4+l8EkXpXHEudfXQwgCyAFQw7RHNSlhOi/hGvXC/FSkkVXBiVCv+YE+
	G9Z/guufiX1OsWMn71A8ut7xId7Myr9NuM2AwPHUK08M4Yl+7NgqMDXwW1BRva+2om8swWn
	GiA+XwShgUOR8f5Jd2X3Vg/8InqTxLLLxnmikIWKz9iGJXaFFMNrCdY0myqjuXrkmbYUyj1
	bAP+/SqWN89I4c0O+8KUfu2gefQ/h8AFF5bdbes65vo3CaaVI3WdHG5UpHIKmcAay0B2Jnd
	H48V7DL5nPqZUyKv6J
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Even though the narrower CRC instructions doesn't require GRLEN=64, they still *aren't* part of LA32 (LoongArch reference manual v1.10, Volume 1, Table 2-1).
Link: https://lore.kernel.org/all/0a7d0a9e-c56e-4ee2-a83b-00164a450abe@xen0n.name/

Therefore, we could not directly add ARCH_HAS_CRC32 to config LOONGARCH.

Thanks,
--
WangYuli

