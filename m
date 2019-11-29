Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5610DA87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 21:16:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Pm4h38bjzDq8F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 07:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhsharma@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="gUwqdG2v"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Plr75MndzDrDT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 07:05:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575057955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RP2PHwp5wZl3ztgeJTb35J2c98KyKZ9pDDlofVv46EI=;
 b=gUwqdG2vIUD5c8utOVu9PtJTXTtcp0/U1+mamJgw4+07O5igZRnjutGzvEjWYKlyc80r6l
 CY4suZOBgind2TfDUw/mfhOKqDwTfelGI2egKrSOhvX7KBzkodMX8xnnpX3Kug/RNO81gG
 be5qKIIHO69CgiWQh1Uy4CB8GahwvxA=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-_oBYyG0KPD2hkcs9cDwNOQ-1; Fri, 29 Nov 2019 15:05:51 -0500
Received: by mail-lf1-f69.google.com with SMTP id u14so4728429lfg.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 12:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zCyHxNb/EFCllk+iZMx0l93yQzrOq+uBxpToCPQHS9k=;
 b=hYN3pMe06A/jxMpFD4gohEYsBFo48dLjjQ3BhOgguRTG6/mFFcPrlIi+bjvI1FR+K1
 biwSAysBtjOucsTh58TPOaAN4AiBO/2hCr4MIJQxeH0JVKv1QY745wZFQ45hBDs2k9u/
 H0dQudzZnAa1QkcdhjQjXXVbfMfu4JqSsWtzhIfQl2V+UbRAGq9kvUle72zR6zKXWPCq
 K+T5jyiEbGKLxS2Op0B5jgs5bqYqsqqxgymRfwKJqxL3VdZMRyMJfhdZAlHpFPefaBG4
 Nn9AGOgmfXcIPFtaBP4UzSxJVHGNQmp87ZfY+P9IZ+AOe6hulzBwv31zYsJEU/rKLB1f
 Ha9w==
X-Gm-Message-State: APjAAAXr2sFPWVKSF7AWOhpk5ZiMRD7ANo6YWbyEG1PN0o4HGZTiKys9
 NOffiWXd2miswBojfD4pGsc5pVLXDIcECpNbSoavEfVoDYUy/Mh10o45GT2JWxJz5F+lZ0r1NKE
 BcvDx4eMEgWj6/WI0+nL5nYAYDH6C+k0NT6uV8msqCQ==
X-Received: by 2002:a2e:9a41:: with SMTP id k1mr12682037ljj.235.1575057949815; 
 Fri, 29 Nov 2019 12:05:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqz0eILOnKMVbbahC3Rp/NyuV7+7BmZiagne10VkRMygf99/om+7iSrw3qCYWoCJXV2cv5Un/9KS0XCSQp5JswM=
X-Received: by 2002:a2e:9a41:: with SMTP id k1mr12682025ljj.235.1575057949585; 
 Fri, 29 Nov 2019 12:05:49 -0800 (PST)
MIME-Version: 1.0
References: <1574972621-25750-1-git-send-email-bhsharma@redhat.com>
 <20191129102421.GA28322@willie-the-truck>
In-Reply-To: <20191129102421.GA28322@willie-the-truck>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Sat, 30 Nov 2019 01:35:36 +0530
Message-ID: <CACi5LpNQPw41kGsW+d0PyZaC7gSrbgwT2VxwyO5r3j83h-mkEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
To: Will Deacon <will@kernel.org>
X-MC-Unique: _oBYyG0KPD2hkcs9cDwNOQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Kazuhito Hagio <k-hagio@ab.jp.nec.com>,
 Boris Petkov <bp@alien8.de>, Dave Anderson <anderson@redhat.com>,
 James Morse <james.morse@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Bhupesh SHARMA <bhupesh.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Will,

On Fri, Nov 29, 2019 at 3:54 PM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Nov 29, 2019 at 01:53:36AM +0530, Bhupesh Sharma wrote:
> > Changes since v4:
> > ----------------
> > - v4 can be seen here:
> >   http://lists.infradead.org/pipermail/kexec/2019-November/023961.html
> > - Addressed comments from Dave and added patches for documenting
> >   new variables appended to vmcoreinfo documentation.
> > - Added testing report shared by Akashi for PATCH 2/5.
>
> Please can you fix your mail setup? The last two times you've sent this
> series it seems to get split into two threads, which is really hard to
> track in my inbox:
>
> First thread:
>
> https://lore.kernel.org/lkml/1574972621-25750-1-git-send-email-bhsharma@r=
edhat.com/
>
> Second thread:
>
> https://lore.kernel.org/lkml/1574972716-25858-1-git-send-email-bhsharma@r=
edhat.com/

There seems to be some issue with my server's msmtp settings. I have
tried resending the v5 (see
<http://lists.infradead.org/pipermail/linux-arm-kernel/2019-November/696833=
.html>).

I hope the threading is ok this time.

Thanks for your patience.

Regards,
Bhupesh

