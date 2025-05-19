Return-Path: <linuxppc-dev+bounces-8748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F5ABD813
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 14:17:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1tqK2l0Jz3bvX;
	Tue, 20 May 2025 22:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747696655;
	cv=none; b=HdzSPc/vLSudDOHfvrloUxwjsLDuWJpCZSGiS9pUZ3EktACkkoRiTBv7eD/vLDKWSP+7hoBmKqPMkgH75d8M1OjIEM4OBn43oJP9rWQR6dUyY4xR77G8+xfYMT2R/91/hOpcGxap/vJyW/gkWm8edginrIzijEy7Yih3sz2yuAH6Ou8o9X+CrqQivqi9mT+wm1TXzEGRL2S+57hGhn9yT2Yf2J8GDJjyMBP1DOMudLODnrRkco+/hULcQhJko9HiWKoBKrY256Gy4UMBqnhsjI7sCGJsCc3QedkwheATQx9QzOFi7rGlKbVROHhUConwpxYsdWfsu+NU+/xkYDWr3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747696655; c=relaxed/relaxed;
	bh=DmthD9gOjRMYbFYgwf7f3Pp9m7CO5reBPjPZv+5NJUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UgCp/g9VNm91AC/GgcscGl1RdKZpkqWhvg6D8IMzWhAKoKn4iijv4dZ6dHaSxiNYoOR4EGR51PCD8gGCgdosl3+Y9cpYCvb9gvMNT/QyEazZrtyxbgriKK5m3F7SUYhYeoNgsO56e8fNaeJ40i1DDbQxhoo2fC//RHPRUGjgCPO8gdpBlGAEkJNGnG5z72WacCy7QoXZNooLzxPJTPec7cfCzF+XQJ8nE9ILxzgoX57x5odffmj/aWac9Q+alX/QqQ85XBXLDaMWziZuS7H3+2/5VQUyZow2D05+0XHiclq4aeqlmuoAGsbnAgiBAPlXXY4cSvWywRxz0MlHaivDBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FrZi21DS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3crwraaukdhktkifrdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--wnliu.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--wnliu.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=FrZi21DS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--wnliu.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3crwraaukdhktkifrdlldib.zljifkrummz-absifpqp.lwixyp.lod@flex--wnliu.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1YW22Dcjz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 09:17:33 +1000 (AEST)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-742b01ad1a5so4833278b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 16:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747696650; x=1748301450; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DmthD9gOjRMYbFYgwf7f3Pp9m7CO5reBPjPZv+5NJUo=;
        b=FrZi21DSuzhdRyeM8qf1t+4hogb25DYHoigdItEi+aMy1IFztuO++He+qWXslb+1NZ
         fNzIkGUshKKglGzK8tvU6PYhOy90P8f8/yOk2paBjqbUVmp77amIE7g1wck/ZhbUXYzy
         VScHnmpChrjpovZi0gAfbXZT+rLJLrleD7e8Jg+ho2g6JmBUYYR9pwg/CSjkIJcyr/RZ
         O92RudqHEFo4470IzsrZuAv9Odue1aTzSHQQYey8JQ25jJEOWTXvoiTvs0ykTeIvSmFs
         viA31GImmP/LJT7aa1Oxmk+cv/syOfejmRRdxLWW5PGHcqEnjwUTrVWGEVBhP+7iDe//
         XNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747696650; x=1748301450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DmthD9gOjRMYbFYgwf7f3Pp9m7CO5reBPjPZv+5NJUo=;
        b=bql67dBDDQAjlcttqwsODFuK5EBlKZDfrPGD0EreDQvABVG94KoQoNGvjaiAJ6D3oC
         zRmssKl9CmHGIq+YTSYuBemfotrKWv5qkFTrVrQEZxv3x+xtDFPUil9/7cN3SoeGe689
         yAHmGpg23MLjKNvOOOwjdLaQjnzXZ4EY8CRFzzSVFB0CL77HLqABfyb7+bxfmt9sIvB+
         HIJbikMUL5D29dXnX4VPaaEmbSodCXTWcqeLpQGU6rAGGred7BJDlztodwyzn03cz7Hn
         IjLsVVHk69NZkc5OXHd17zjDk7l5CCEIDnSsbo89Aj/K2PHLEw6eNi1rU8SGneMVjKLJ
         gRKw==
X-Forwarded-Encrypted: i=1; AJvYcCWHgZDCdxmrF+yJ0uDSaMVLzQTy0amRUh5KwA7pPEfBn42j+8PJ7bDsORqKtZLMdZIjxradTMpd7aunfsY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4R5mg5sbV/mjtaqVAO7Ks3FXVe1loWHG8NBbb9znhuFf05xC9
	s31Fvr1sJy2dITh+VM0CZMYAX67Qarq5ojyuglXLXw16ulEHN3h1EbaY2YlWldEK/xRjt4I+/Np
	Lfw==
X-Google-Smtp-Source: AGHT+IGHEcM9TKn9Xc+i00afYHv2TzrmaQimUBUqfrRdNBd15kPNJCmvHKHimXydU6G//VEGl/fNmC3mKA==
X-Received: from pfnj10.prod.google.com ([2002:aa7:83ca:0:b0:730:743a:f2b0])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:391a:b0:740:a879:4f7b
 with SMTP id d2e1a72fcca58-742acd5115amr18271072b3a.18.1747696650122; Mon, 19
 May 2025 16:17:30 -0700 (PDT)
Date: Mon, 19 May 2025 23:17:28 +0000
In-Reply-To: <20250519213603.1257897-12-helgaas@kernel.org>
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
Mime-Version: 1.0
References: <20250519213603.1257897-12-helgaas@kernel.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519231728.2550572-1-wnliu@google.com>
Subject: [PATCH v6 11/16] PCI/AER: Check log level once and remember it
From: Weinan Liu <wnliu@google.com>
To: helgaas@kernel.org
Cc: Jonathan.Cameron@huawei.com, anilagrawal@meta.com, ben.fuller@oracle.com, 
	bhelgaas@google.com, dave.jiang@intel.com, drewwalton@microsoft.com, 
	ilpo.jarvinen@linux.intel.com, kaihengf@nvidia.com, 
	karolina.stolarek@oracle.com, kbusch@kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, lukas@wunner.de, 
	mahesh@linux.ibm.com, martin.petersen@oracle.com, oohall@gmail.com, 
	pandoh@google.com, paulmck@kernel.org, rrichter@amd.com, sargun@meta.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, shiju.jose@huawei.com, 
	terry.bowman@amd.com, tony.luck@intel.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 315bf2bfd570..34af0ea45c0d 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -252,6 +252,7 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
>   else
>   info->severity = AER_NONFATAL;
>
> + info->level = KERN_WARNING;
>  return 1;
> }

I think the print level should be KERN_ERR for uncorrectable errors.


