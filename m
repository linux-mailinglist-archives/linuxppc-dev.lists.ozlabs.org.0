Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7E295CEC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 12:48:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH3xz27cCzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 21:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=feiTNY17; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH3wP0yKszDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 21:47:31 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BA392177B;
 Thu, 22 Oct 2020 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603363648;
 bh=xBsbKD5SBQCcLeBR2tpUTrjFtW93i8KwvEiKlew6y/M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=feiTNY176OhJVWL6CnkF4kiU6NigFm/VD3Ui4E+wpATVknPWx7I4BQqdiJv/sMgNJ
 H4Eb2Bc9W6InfW+morvNSQUtX8ZVPuBvKSpQrb3i+BcForuB10ZbuKl1VEpEEP0vUn
 prey8EZuMSul8lL3YVDZeBuHUKxl2I6g/LFzXfXQ=
Date: Thu, 22 Oct 2020 12:48:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
Message-ID: <20201022104805.GA1503673@kroah.com>
References: <20201021233914.GR3576660@ZenIV.linux.org.uk>
 <20201022082654.GA1477657@kroah.com>
 <80a2e5fa-718a-8433-1ab0-dd5b3e3b5416@redhat.com>
 <5d2ecb24db1e415b8ff88261435386ec@AcuMS.aculab.com>
 <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 David Laight <David.Laight@aculab.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 11:36:40AM +0200, David Hildenbrand wrote:
> On 22.10.20 11:32, David Laight wrote:
> > From: David Hildenbrand
> >> Sent: 22 October 2020 10:25
> > ...
> >> ... especially because I recall that clang and gcc behave slightly
> >> differently:
> >>
> >> https://github.com/hjl-tools/x86-psABI/issues/2
> >>
> >> "Function args are different: narrow types are sign or zero extended to
> >> 32 bits, depending on their type. clang depends on this for incoming
> >> args, but gcc doesn't make that assumption. But both compilers do it
> >> when calling, so gcc code can call clang code.
> > 
> > It really is best to use 'int' (or even 'long') for all numeric
> > arguments (and results) regardless of the domain of the value.
> > 
> > Related, I've always worried about 'bool'....
> > 
> >> The upper 32 bits of registers are always undefined garbage for types
> >> smaller than 64 bits."
> > 
> > On x86-64 the high bits are zeroed by all 32bit loads.
> 
> Yeah, but does not help here.
> 
> 
> My thinking: if the compiler that calls import_iovec() has garbage in
> the upper 32 bit
> 
> a) gcc will zero it out and not rely on it being zero.
> b) clang will not zero it out, assuming it is zero.
> 
> But
> 
> a) will zero it out when calling the !inlined variant
> b) clang will zero it out when calling the !inlined variant
> 
> When inlining, b) strikes. We access garbage. That would mean that we
> have calling code that's not generated by clang/gcc IIUC.
> 
> We can test easily by changing the parameters instead of adding an "inline".

Let me try that as well, as I seem to have a good reproducer, but it
takes a while to run...

greg k-h
