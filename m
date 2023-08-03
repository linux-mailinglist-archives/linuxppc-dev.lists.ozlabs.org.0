Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71876F17E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 20:10:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3HG/Iqr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGxjQ6wbPz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 04:10:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGxhM1S0zz2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 04:09:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0dEImclfLlmfTU0yTnFzJTof7y09txrCVp+rAtpvb1A=; b=Q3HG/IqrxhjbWVUPp+QxIv0M1M
	CQDRO12DZSkGS5jgxTy1lTzGCbAt0VPfKVjWzx5PwJFoM/CNjPu1pDLEfCKrZzwziQHSLvWxbeM2f
	BZ8VxSXklUYAQlj3+f5Kz6bnN3jqkTjocUVE0SjFPJlb2l9IWU4vM5eSnb3jwpN6adAOIOFzz4A3t
	9qzqv/mIFVddvR1Tfe8iJx+/ypoasiZODYZhfoMRX0KxmslYD3qhhSKSiKolEpT/6fWl+1OgkK7B0
	mtQvVTVyt9n9GKsLnj4XvXQ5Iztv4LIMmjLDNSO3r7x5tw6sR0i65zXcsWUMUZ9Hjv55m8RG7LbEo
	Q7F/U0lg==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qRclc-00AXuC-0M;
	Thu, 03 Aug 2023 18:09:44 +0000
Message-ID: <63bc327d-999a-1654-e7b5-6bcfd7477a32@infradead.org>
Date: Thu, 3 Aug 2023 11:09:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 RESEND*3] ASoC: fsl MPC52xx drivers require
 PPC_BESTCOMM
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230803025941.24157-1-rdunlap@infradead.org>
 <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <9581313f-5340-455d-a75d-dc27d2eb3ec0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 8/3/23 04:27, Mark Brown wrote:
> On Wed, Aug 02, 2023 at 07:59:41PM -0700, Randy Dunlap wrote:
>> Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
>> SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
>> so the 2 former symbols should also depend on PPC_BESTCOMM since
>> "select" does not follow any dependency chains.
> 
> Take a hint, it's not clear that the patch is tasteful.

Thank you for replying.  I'll drop it and just report the build errors.

-- 
~Randy
