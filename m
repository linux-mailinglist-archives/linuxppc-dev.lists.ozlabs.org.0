Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D601E58FF06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 17:15:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Vk05Fbrz3c7P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 01:15:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3VjZ5CsBz2xtT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 01:15:12 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27BFD3ac002302;
	Thu, 11 Aug 2022 10:13:03 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 27BFD3mY002301;
	Thu, 11 Aug 2022 10:13:03 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 11 Aug 2022 10:13:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
Message-ID: <20220811151302.GF25951@gate.crashing.org>
References: <20220725063111.120926-1-rmclure@linux.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725063111.120926-1-rmclure@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Mon, Jul 25, 2022 at 04:31:11PM +1000, Rohan McLure wrote:
> +	/*
> +	 * Zero user registers to prevent influencing speculative execution
> +	 * state of kernel code.
> +	 */
> +	NULLIFY_GPRS(5, 12)
> +	NULLIFY_NVGPRS()

"Nullify" means "invalidate", which is not what this does or is for :-(


Segher
