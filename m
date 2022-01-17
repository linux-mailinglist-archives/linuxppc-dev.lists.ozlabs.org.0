Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684F490395
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 09:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JclCJ0KNWz3002
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 19:18:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ARIRBjMG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=ARIRBjMG; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JclBc0vNPz2x9g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 19:17:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64B8CB80C85;
 Mon, 17 Jan 2022 08:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66080C36AE7;
 Mon, 17 Jan 2022 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642407440;
 bh=7V2uwOg2XQE1qErJ/nwZj130Wi+eTJqoL9PiUIS/Pns=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ARIRBjMGLNFTzyzqbzZQTigMaGQKjAFdQ0c4oJ4IhKR/qZYM8DV6yeq+hcYK5JfXA
 MILnT071KlV1itZZMKNAiiFe/jzhUn3qA9tEbN7YrC2S/Zs3Cr7yu3NxPy+wrawLju
 SNmb/dPtxcYjASeq6EnT8mZ0l6NDJNcJzC0iEKb4=
Date: Mon, 17 Jan 2022 09:17:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc: Add missing SPDX license identifiers to DTS
 files
Message-ID: <YeUmDV8vgHO592qt@kroah.com>
References: <633873803244c2122381cb11228a6a9a7385abd4.1642402958.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <633873803244c2122381cb11228a6a9a7385abd4.1642402958.git.christophe.leroy@csgroup.eu>
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

On Mon, Jan 17, 2022 at 07:03:45AM +0000, Christophe Leroy wrote:
> Several DTS files are missing SPDX license identifiers.

Normally DTS files are not just GPLv2, are you sure this is intended?

> 
> For files in fsl/ subdirectory, GPL v2 or later is used based
> on the comments in the files.

You do not seem to have gotten the license correct for these, the text
in the file comments disagrees with GPLv2+ only.

Please be VERY careful when adding license tags to files like this, if
this patch was accepted it would get very confusing as they are
contradictions in the file itself suddenly.

Also, when adding SPDX lines, remove the boiler-plate license text at
the same time so that we can verify that the SPDX line is correct.  If
you had done that here, it would be obvious that the patch is incorrect.

As-is, this patch is not acceptable, sorry.

greg k-h
