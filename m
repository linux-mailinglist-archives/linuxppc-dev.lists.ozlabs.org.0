Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1ED8600176
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Oct 2022 18:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mr5h36TfFz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Oct 2022 03:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mr5gS3mMlz2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Oct 2022 03:49:07 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 29GGkuWd022683;
	Sun, 16 Oct 2022 11:46:56 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 29GGksar022682;
	Sun, 16 Oct 2022 11:46:54 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 16 Oct 2022 11:46:54 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: Re: Issues with the first PowerPC updates for the kernel 6.1
Message-ID: <20221016164654.GH25951@gate.crashing.org>
References: <0D40FEF9-D87D-42C4-BC31-EC8AE952C1FB@xenosoft.de> <0D8C8783-238D-4B4D-BA3D-766AB7139253@xenosoft.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D8C8783-238D-4B4D-BA3D-766AB7139253@xenosoft.de>
User-Agent: Mutt/1.4.2.3i
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
Cc: Darren Stevens <darren@stevens-zone.net>, Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, npiggin@gmail.com, rmclure@linux.ibm.com, mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>, Trevor Dickinson <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 14, 2022 at 06:11:21PM +0200, Christian Zigotzky wrote:
> make oldconfig has asked because of the CPU family. I choosed GENERIC for my P.A. Semi PWRficient PA6T-1682M. Is this correct? Maybe this is the problem.
> 
> config GENERIC_CPU
> -	bool "Generic (POWER4 and above)"
> +	bool "Generic (POWER5 and PowerPC 970 and above)"
>  	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
>  	select PPC_64S_HASH_MMU
> 
> There isn’t a POWER4 anymore and I used it via CONFIG_GENERIC_CPU=y before.

PA6T is ISA 2.04, just like POWER5+.  It should be fine.


Segher
