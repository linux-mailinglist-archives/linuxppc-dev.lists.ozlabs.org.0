Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC641046C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 23:58:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JJ502MRvzDqMn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 09:58:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codethink.co.uk (client-ip=176.9.8.82;
 helo=imap1.codethink.co.uk; envelope-from=ben.hutchings@codethink.co.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=codethink.co.uk
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JJ176wH4zDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 09:54:51 +1100 (AEDT)
Received: from [167.98.27.226] (helo=xylophone)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iXXrA-0005Bw-71; Wed, 20 Nov 2019 21:49:48 +0000
Message-ID: <d82ef7b94b9c3adc4fbb4e62c17b81a868fb32d8.camel@codethink.co.uk>
Subject: Re: [Y2038] [PATCH 3/8] powerpc: fix vdso32 for ppc64le
From: Ben Hutchings <ben.hutchings@codethink.co.uk>
To: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 20 Nov 2019 21:49:47 +0000
In-Reply-To: <CAK8P3a3BPhX_NRFj66WyRLQUOCV-FGRjmPCgB7gqxMoK8hfywg@mail.gmail.com>
References: <20191108203435.112759-1-arnd@arndb.de>
 <20191108203435.112759-4-arnd@arndb.de>
 <fdcb510863c801f1f64448e558ee0f8ed20db418.camel@codethink.co.uk>
 <CAK8P3a3BPhX_NRFj66WyRLQUOCV-FGRjmPCgB7gqxMoK8hfywg@mail.gmail.com>
Organization: Codethink Ltd.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-11-20 at 20:35 +0100, Arnd Bergmann wrote:
> On Wed, Nov 20, 2019 at 8:13 PM Ben Hutchings
> <ben.hutchings@codethink.co.uk> wrote:
> > On Fri, 2019-11-08 at 21:34 +0100, Arnd Bergmann wrote:
> > > On little-endian 32-bit application running on 64-bit kernels,
> > > the current vdso would read the wrong half of the xtime seconds
> > > field. Change it to return the lower half like it does on
> > > big-endian.
> > 
> > ppc64le doesn't have 32-bit compat so this is only theoretical.
> 
> That is probably true. I only looked at the kernel, which today still
> supports compat mode for ppc64le, but I saw the patches to disable
> it, and I don't think anyone has even attempted building user space
> for it.

COMPAT is still enabled for some reason, but VDSO32 isn't (since 4.2).

Ben.

-- 
Ben Hutchings, Software Developer                         Codethink Ltd
https://www.codethink.co.uk/                 Dale House, 35 Dale Street
                                     Manchester, M1 2HF, United Kingdom

