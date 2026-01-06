Return-Path: <linuxppc-dev+bounces-15298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A658CF71FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 08:50:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dljyG4Pcfz2yKr;
	Tue, 06 Jan 2026 18:50:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767685830;
	cv=none; b=Mw5dZUVxqIquMq4D1+oG1ffvnqangHxA3e9rX/p2oNwtG7G/LHOp9jAgAEwTv8w+jZBc5Iq8bt6Vj44VZmGHsHnY9wVBD4UiGRKFAx4w0EYir7Rv8jU7CfZ80+xQdLEOlncxG48afJZ+eIneFXj/t7t9Axc4DLxf5oBL6X2R7wxIZ/EyDD1z7df8jxSGgWos3XrVRRIaYaAG0q3xoV+VfiFYNrhRbk2x5xCW97Ak92/ilwwDUcbtdLVl29uY56rFEgfHGx+IhCMTmDQId6XDAouUuM/GCl7GyEntP7wS2eYy/0WNdZuvoIvbFwRONtLaYRbY7N92306+Y6xjtMMuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767685830; c=relaxed/relaxed;
	bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SfWOChb6qohS7Y4e6H04gpcsP1iGtQbVPD6K6D8Rdy2I/rCPysxjeh8kTUiDvmRHTrY053ostWuCh08rw6Q8lGXYPtA+X60XfX5ltebnAmEGaw1yxhgLUwlbmyRW6U2R1bp7ScZtYq1GBUJsW0gAk0Ep/+99qrX35hMU2yGFzS7mA6eyeNyXsQ6zk3NqiMk/yaLiJ+jQA0mRDseGQ4PVJKemHokE3yfCXCs5Ka0+CpPLm0q3JTOh/ogjFW0T3ctXAsQQba+39gFgXRKHs8v+TsGysCq8OzcGqxrHEbe0GHK5uc1o/dnCboQtn3uLCxYXOkQUjUgkF0CZj5w0e9/NlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYKQflH1; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYKQflH1; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYKQflH1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UYKQflH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dljyD6gPDz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 18:50:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767685824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
	b=UYKQflH1BcelkAhgGHtc4xMkD9EvXMsO0CA9heSHIv8bh1jxpzXDP65Qhx4YorgeRu0Qnz
	o9C1EcZY34WWB+rL/5v11nrli3AoH11VWsJY8MtMIYGATC//iXCMnPJWxpa+sGFFOHMl8K
	uf/VGTU6ne2YjQI94+tKZYPkMKmVico=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767685824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
	b=UYKQflH1BcelkAhgGHtc4xMkD9EvXMsO0CA9heSHIv8bh1jxpzXDP65Qhx4YorgeRu0Qnz
	o9C1EcZY34WWB+rL/5v11nrli3AoH11VWsJY8MtMIYGATC//iXCMnPJWxpa+sGFFOHMl8K
	uf/VGTU6ne2YjQI94+tKZYPkMKmVico=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-311-usCpQVlBPxaigwPE-hbTVg-1; Tue, 06 Jan 2026 02:50:23 -0500
X-MC-Unique: usCpQVlBPxaigwPE-hbTVg-1
X-Mimecast-MFC-AGG-ID: usCpQVlBPxaigwPE-hbTVg_1767685822
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c7957d978aso935669b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 23:50:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767685822; x=1768290622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJIbYSfSK52lKhhoL+Hqgsx6BnLJaDz2mdyD5+Wu3vQ=;
        b=HgcVWHRDGmpSyPsrri4MorHZ1p70Hj47zW9JsU9vtF42MT1AfB2/p0uTl1KTjFA8Wt
         ksK2iDDrC3Yc4HEFFV6BhPKEn679WLEFkOKpG59SHEzRGhm5SJCotw6srMGQ7P8dnysP
         glZo5xsKXxET+3oKseVKmQdQUQJ4Dkf4YtNS3R2/NvTWbkHKhmt3onjwy7Hpn62iWsmo
         FnA/4aaAwHcOVjHc9eudV8nrj5XBaM9H++Ss4IPEAMwRjPdRoHWjUlJGSmFFee8JLLtR
         Jq/3jO2b6ooxuJFLTGGeP2xpV+AWxh5bi6oF7WHY5QjMnwt1GZP5ptKdDaqE2A4DywQQ
         u9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQaCbFRxI3iEN+LJeFVBcQeiNeOcQ9mp7XH9k8rNU2gyl/1fYm52gflIc/JY6FBjOxy+82LWWZZUpGH34=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzsqDmZx6dDLUc+bjJqQDeLd8wzKDeGflA66Vhfqofsuh1wC3Mi
	y6BkvuWUmTjrxhHnqYixRIKOvQBM+PiiJWhnomQS249UdLqWCkBpT3pzzNogMx3yMv2GUfv3lqF
	r711Si+Zv9Wj6YDRkpAPUxsr6l67+Fl6UmCoZ1oZ1k8Zh0d+Fp6Opkl1vDIfIq7DfbbQ=
X-Gm-Gg: AY/fxX5uGedkOGetnZcg4mGixwKQV3gmBGMzB7Wmrm3J8QjD9EkPHTxiT3Nyr7G3FwS
	Ww7cdhazeXB/OZ1meXeX9aRl3QO+226qJEOCeVhz0Epy2SK0rEGx+IZ3aKM9AMOqN4hnUKI1UA3
	cHEpxJFDKdk8BAmhjq8SNcAp+CQVupboIYCkycOQfmSQT8zWPiA127mO+cdFswhxC4IiCWiVWBD
	4C7aSLmtydlG0PjiA3h3dWJl807excG2APl7C2T+YfgpPMVhT7i4E14ABUrJnu1bU6Ia87zuVu6
	XhiFK61tR0PXwqrZoVs/JCxdJHAN/TggKI7UrC4yImLFlwXWa7Uos+cfezRne/MvwBy1KbpMUGJ
	c
X-Received: by 2002:a05:6a00:1d25:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81882ddd7c3mr1845208b3a.63.1767685821900;
        Mon, 05 Jan 2026 23:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDKsDXMRpPACVaN2GdRV6l0Fy6KDBpzSzhtqSYzxT7W76UAFruKAKNIbDHoNo+0oE4mtloEg==
X-Received: by 2002:a05:6a00:1d25:b0:7e8:4471:8de with SMTP id d2e1a72fcca58-81882ddd7c3mr1845179b3a.63.1767685821335;
        Mon, 05 Jan 2026 23:50:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0ddf97sm1263404b3a.19.2026.01.05.23.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 23:50:20 -0800 (PST)
Date: Tue, 6 Jan 2026 15:46:57 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Thomas Staudt <tstaudt@de.ibm.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aVy9qfeSDZyKybIC@Rk>
References: <20251226140636.1378505-1-coxu@redhat.com>
 <202512272218.ghBaSjzO-lkp@intel.com>
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
In-Reply-To: <202512272218.ghBaSjzO-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OYwVVs91wIFwVj6DfZNs6iLMlkaEAePXnRk_hyPs3cA_1767685822
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Dec 27, 2025 at 10:35:11PM +0800, kernel test robot wrote:
>Hi Coiby,
>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/powerpc-kdump-pass-dm-crypt-keys-to-kdump-kernel/20251226-220726
>base:   ccd1cdca5cd433c8a5dff78b69a79b31d9b77ee1
>patch link:    https://lore.kernel.org/r/20251226140636.1378505-1-coxu%40redhat.com
>patch subject: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
>config: powerpc64-randconfig-001-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/config)
>compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272218.ghBaSjzO-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/
>
>All errors (new ones prefixed by >>):
>
>>> arch/powerpc/kexec/elf_64.c:95:9: error: call to undeclared function 'crash_load_dm_crypt_keys'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      95 |                 ret = crash_load_dm_crypt_keys(image);
>         |                       ^
>   1 error generated.

This issue has been addressed in v2
https://lore.kernel.org/all/20260106074039.564707-1-coxu@redhat.com/

Thanks!

-- 
Best regards,
Coiby


