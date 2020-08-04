Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D7123BB3A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 15:37:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLbQX23LYzDqYt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 23:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12a;
 helo=mail-il1-x12a.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iIcb534I; dkim-atps=neutral
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLbLs52vszDqRR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 23:33:56 +1000 (AEST)
Received: by mail-il1-x12a.google.com with SMTP id c16so22355451ils.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 06:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xhClNq/HCpBReOShm+4lUZuMrYELtFHHHjv0pGdQMRM=;
 b=iIcb534IqNJBFEMOF1kGXzLFTz4dxADZjibG2aHxkVMkgyrkeFyk5ZMTBDi8kxZqfx
 DTqX8NijQiecdB1kyfFjUUUXqUxUT5Fyzf9boGfCjFuRzZ6wcn/0r+kbC2HNiQvCAvuj
 GDyy/h8z1246DwlJcBRE4bFrEftOO702jfV954R+3DWlaLJaRSfpgWfR8XfOB7GkDTGm
 HbsgMqwynXzxU1jTymKThZ12lKShZBf9QxAHRTlfp67Po4FA30ECFXhk+3/jA2iYymTd
 qF01K2vYhNvCjnXMBPNjTus8q9o3ZYvDFdbNW1R3gE1PozftTUuAV/jVdHpGysZfsBBe
 Xtqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xhClNq/HCpBReOShm+4lUZuMrYELtFHHHjv0pGdQMRM=;
 b=bFbmsrF6oUZGT+tkccFLoWqC+jcBTzRuxMFf4KyfTQtjQuh6xTlmAHLDrqhvrOsJxK
 VD2pssm/DJt8GqzMVivXqP7rq/9jThcZA2NT562+0FCp8Ja+PkBueiBtAOGIKMV5ODMr
 eHRhjJ3UFTz/30Kaq5MVGpB988RhExwQU1xkKSmvzIkn5ME5M9ZHnEC0pgPspCSRtPOW
 dJlqlIuvQ/bSH+WM1ihdUfv09MyNHEHCZ49kQ4X42wCAMZ35nHp1NwO4RzEulxrCkZOg
 usgS7FrLUrdAhYQES1SDPH/ni5Fk2V1cS/tp/R6Xa21EmwPVbxAu0Bh+C0+zRcCH7rHY
 V/QA==
X-Gm-Message-State: AOAM530BEf+eNelgG+clul3W0iR5LPZa2tFCyztqcFVUNqF2Zl+gu0vb
 kFsMt4IhCytUHVFL/JsuLwcGW06YhHcQkg22tg==
X-Google-Smtp-Source: ABdhPJwfP/rdGT43T5vsBM32yQb752R74rbUuWewCoTKACJMnJwoLKMAJ4CMjfZZ7O13ofKd20OCZNsR+N0Mza2x91c=
X-Received: by 2002:a05:6e02:1002:: with SMTP id
 n2mr4667029ilj.117.1596548030311; 
 Tue, 04 Aug 2020 06:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
 <ee585548-aefc-ff3f-6a79-e616b9e04f12@linux.ibm.com>
In-Reply-To: <ee585548-aefc-ff3f-6a79-e616b9e04f12@linux.ibm.com>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Tue, 4 Aug 2020 21:33:39 +0800
Message-ID: <CAFgQCTt=qjaYtOUvt7sy1PiSo1sDdGn9Dktyu9O26QXagvbNFQ@mail.gmail.com>
Subject: Re: [PATCHv4 1/2] powerpc/pseries: group lmb operation and memblock's
To: Laurent Dufour <ldufour@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 3, 2020 at 9:52 PM Laurent Dufour <ldufour@linux.ibm.com> wrote:
>
> > @@ -603,6 +606,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
> >         }
> >
> >         lmb_set_nid(lmb);
> > +       lmb->flags |= DRCONF_MEM_ASSIGNED;
> > +
> >         block_sz = memory_block_size_bytes();
> >
> >         /* Add the memory */
>
> Since the lmb->flags is now set earlier, you should unset it in the case the
> call to __add_memory() fails, something like:
>
> @@ -614,6 +614,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>         rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
>         if (rc) {
>                 invalidate_lmb_associativity_index(lmb);
> +               lmb->flags &= ~DRCONF_MEM_ASSIGNED;
You are right. I will fix it in V5.

Thanks,
Pingfan
