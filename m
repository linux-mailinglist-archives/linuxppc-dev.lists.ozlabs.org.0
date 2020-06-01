Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E67111EB264
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 01:51:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49bX4f30nCzDqDW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jun 2020 09:51:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=telegraphics.com.au (client-ip=98.124.60.144;
 helo=kvm5.telegraphics.com.au; envelope-from=fthain@telegraphics.com.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=telegraphics.com.au
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by lists.ozlabs.org (Postfix) with ESMTP id 49bX2z2VtHzDqKb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jun 2020 09:49:47 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 2472C27449;
 Mon,  1 Jun 2020 19:49:37 -0400 (EDT)
Date: Tue, 2 Jun 2020 09:49:36 +1000 (AEST)
From: Finn Thain <fthain@telegraphics.com.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
In-Reply-To: <CAMuHMdVs8ur9pWWEFbYmPLRgdH67coSSrPO0QE8RqFvKjhgyYg@mail.gmail.com>
Message-ID: <alpine.LNX.2.22.394.2006020936430.8@nippy.intranet>
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
 <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com>
 <alpine.LNX.2.22.394.2006011006080.8@nippy.intranet>
 <CAMuHMdVs8ur9pWWEFbYmPLRgdH67coSSrPO0QE8RqFvKjhgyYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 1 Jun 2020, Geert Uytterhoeven wrote:

> >
> > Sure, it could be absorbed by both asm/mac_iop.h and 
> > drivers/macintosh/adb-iop.c [...]
> 
> asm/mac_iop.h doesn't include asm/adb_iop.h (at least not in my tree, 
> but perhaps you have plans to change that?), so there's only a single 
> user.

What I meant by "both" was that part of asm/adb_iop.h could be absorbed by 
drivers/macintosh.adb-iop.c and the rest by asm/mac_iop.h. (And some of it 
could be tossed out.) I suspect that much of arch/m68k/include/asm could 
get the same treatment. But I doubt that there is any pay off, because the 
headers rarely change where they relate to hardware characteristics.
