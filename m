Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F81496286
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:01:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgPHn5NQlz3cQP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 03:01:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZGgwbcxr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ZGgwbcxr; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgPH90P04z2xWT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:00:37 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C8945B81FB0;
 Fri, 21 Jan 2022 16:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E36C340E1;
 Fri, 21 Jan 2022 16:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642780831;
 bh=KmwEb7jWchsW/K1+WMCn24NvCHz3jZARETYvGom7mFI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGgwbcxrOqaY8HO1bxM0Uzp6CwF9qY1bb1lJbuWa9vbOTuPzEe9hs/eg/FRp0MkMJ
 vzD+e/xpj4lzimqqcMt5vzGxcIP1lQtxHOM3Q9yGMK6Ir0obO35ShPYbAR28EsAnCQ
 Y5sTrqFDhg9ER/3/inri0JZokc8F2ZKoygLvUCLM=
Date: Fri, 21 Jan 2022 17:00:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
Message-ID: <YerYl3xPnp7uelS4@kroah.com>
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
 <YerEuE6XlslE3Goo@kroah.com>
 <24829c2f-6855-c8d6-7ae4-17c5517f890d@csgroup.eu>
 <YerO8MjbXlvbMEsZ@kroah.com>
 <7d551fc7-0b71-dd34-c489-43bf9e337efb@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d551fc7-0b71-dd34-c489-43bf9e337efb@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 03:34:24PM +0000, Christophe Leroy wrote:
> 
> 
> Le 21/01/2022 à 16:19, Greg Kroah-Hartman a écrit :
> > On Fri, Jan 21, 2022 at 03:13:50PM +0000, Christophe Leroy wrote:
> >>
> >>
> >> Le 21/01/2022 à 15:35, Greg Kroah-Hartman a écrit :
> 
> ...
> 
> >>>> @@ -20,16 +16,6 @@
> >>>>     * respects; for example, they cover modification of the file, and
> >>>>     * distribution when not linked into another program.)
> >>>>     *
> >>>> - * This file is distributed in the hope that it will be useful, but
> >>>> - * WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> >>>> - * General Public License for more details.
> >>>> - *
> >>>> - * You should have received a copy of the GNU General Public License
> >>>> - * along with this program; see the file COPYING.  If not, write to
> >>>> - * the Free Software Foundation, 51 Franklin Street, Fifth Floor,
> >>>> - * Boston, MA 02110-1301, USA.
> >>>> - *
> >>>>     *    As a special exception, if you link this library with files
> >>>>     *    compiled with GCC to produce an executable, this does not cause
> >>>>     *    the resulting executable to be covered by the GNU General Public License.
> >>>
> >>> Look at that "special exception", why are you ignoring it here?  You
> >>> can't do that :(
> >>
> >> I'm not ignoring it, that's the reason why I left it.
> > 
> > You ignore that part of the license in the SPDX line, why?
> > 
> >> Isn't it the correct way to do ? How should it be done ?
> > 
> > You need to properly describe this in the SPDX line.  You did not do so
> > here, which means that any tool just looking at the SPDX line would get
> > this license wrong.
> 
> How do you describe such an exception on the SPDX line then ?
> 
> You add " WITH GCC-exception-2.0" to the SPDX line ? Am I understanding 
> correctly ?

I do not know, please ask the SPDX people.

There's a reason we didn't catch these files in our original sweep, and
that is because they take some manual work.  Which is great to see you
doing, but realize it isn't as simple as your first set of patches were
:)

thanks,

greg k-h
