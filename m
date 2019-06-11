Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096E3D3F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 19:24:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NcLV37kJzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:24:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NcJN1fcwzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 03:22:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BvxvNFt2"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45NcJN0zxgz8w3H
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 03:22:28 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45NcJN0p6Tz9s3l; Wed, 12 Jun 2019 03:22:28 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e42; helo=mail-vs1-xe42.google.com;
 envelope-from=oded.gabbay@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BvxvNFt2"; 
 dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45NcJM3SCBz9s4Y
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 03:22:27 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id v129so8413964vsb.11
 for <linuxppc-dev@ozlabs.org>; Tue, 11 Jun 2019 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch5ySbq0FmSA2XajIVEvQlmmFhHNIePL/QuQTBUXjwE=;
 b=BvxvNFt2CuRdvPDlu+YFPGTgJ0ILAjwFJunihoBUnffJQ6arR0U0poSOngu54e31oM
 yX2FndF/g5urg4zuLG7xfVHMK42maMFVSTpmEbMgWWPBDBrmVUmTA7zoQc6XA6KtJD7b
 n8AHQVrCvlKCojNGcjKziVI7e/dqruYe0fOczUG/4HftPDxxm9sg1Cc6hAHNDBep9imZ
 XCmoUcmOESEHWXRd+aZ46Yxyf9fi+CP/DC+Vk++8ZJdGh3HyhS89+DeAk1SrYID7JOHQ
 7KTqbEUqb16tINbU3onFOC6K4/NMO4O/bFKSJ7gt+vCiwepfkHdS+xDh7LuPaz3GJtgs
 fFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch5ySbq0FmSA2XajIVEvQlmmFhHNIePL/QuQTBUXjwE=;
 b=fkwBdsBK4IZTodCSUkIdISrwCkZHT4TmyM4iDhN8FPC73YOuXSIuIxZ9DqhgGU3VTb
 ymzomh1pDpBMnOqwGoHw5Fi7OPpNZ5KsEFC23iL7AIxBtOoxw8C3RW7WuQRsHVCc3Se7
 uxzd9b/hXGdJ3WLFLVp46BsOF1oDn2Aj5NLor6XP3no65RFnuyEkWajO+CTrA1jM+Fzb
 5NqaXifXVCGWLEx/YEg64K2/lb/jWiQHJnCBD6waKABF6o6Lo40w8KzkYGGDGtRLTrMY
 u+efTlQ1TepWb70oPYwcrP21w+WUlmapjCz9MMxQNaF0F6vuFVymFVSL0ftzuuo5DYa8
 Tonw==
X-Gm-Message-State: APjAAAVl+3bvqJ9OAzayPCXby10mFb+trpEyLpk3CfiFzghkl/R35Khz
 viUvB2RdWKoPfekWDdqFkCmta8dm70joinUsoFg=
X-Google-Smtp-Source: APXvYqxxtk2fyTdB5HLiUpLv+cHy2F//+aDjWV45YDWLO4QWQ+SzCCmrZzf6DWcxyJaIog0QW8ScWSukBqD64YkZ1RE=
X-Received: by 2002:a67:d410:: with SMTP id c16mr32239283vsj.61.1560273743742; 
 Tue, 11 Jun 2019 10:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf11EM9+NDML9hQmk9-rPzSmDmAyVLW+qOfs6h62dGK6H9A@mail.gmail.com>
 <20190611140725.GA28902@infradead.org>
In-Reply-To: <20190611140725.GA28902@infradead.org>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 11 Jun 2019 20:21:58 +0300
Message-ID: <CAFCwf13WgnbxHe2wpb3mnw2PLWCgor=136_VSSPQCVodu17uvA@mail.gmail.com>
Subject: Re: Question - check in runtime which architecture am I running on
To: Christoph Hellwig <hch@infradead.org>
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
Cc: linuxppc-dev@ozlabs.org,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2019 at 5:07 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Tue, Jun 11, 2019 at 03:30:08PM +0300, Oded Gabbay wrote:
> > Hello POWER developers,
> >
> > I'm trying to find out if there is an internal kernel API so that a
> > PCI driver can call it to check if its PCI device is running inside a
> > POWER9 machine. Alternatively, if that's not available, if it is
> > running on a machine with powerpc architecture.
>
> Your driver has absolutely not business knowing this.
>
> >
> > I need this information as my device (Goya AI accelerator)
> > unfortunately needs a slightly different configuration of its PCIe
> > controller in case of POWER9 (need to set bit 59 to be 1 in all
> > outbound transactions).
>
> No, it doesn't.  You can query the output from dma_get_required_mask
> to optimize for the DMA addresses you get, and otherwise you simply
> set the maximum dma mask you support.  That is about the control you
> get, and nothing else is a drivers business.

I don't want to conduct two discussions as I saw you answered on my patch.
I'll add the ppc mailing list to my patch.
Oded
