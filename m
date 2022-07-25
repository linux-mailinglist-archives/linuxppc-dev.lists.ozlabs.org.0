Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC41B57F800
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 03:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrjYr6Twsz3cgh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:46:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrjYS3hRRz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 11:45:48 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26P1hYYi023169;
	Sun, 24 Jul 2022 20:43:35 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26P1hX9Z023168;
	Sun, 24 Jul 2022 20:43:33 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 24 Jul 2022 20:43:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: wangjianli <wangjianli@cdjrlc.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV:fix repeated words in comments
Message-ID: <20220725014333.GR25951@gate.crashing.org>
References: <20220724054137.58504-1-wangjianli@cdjrlc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724054137.58504-1-wangjianli@cdjrlc.com>
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 24, 2022 at 01:41:37PM +0800, wangjianli wrote:
> From: Jianli Wang <wangjianli@cdjrlc.com>
> 
> Delete the redundant word 'do'.

> -	/* invalidate the entry (what do do on error from the above ?) */
> +	/* invalidate the entry (what do on error from the above ?) */

Probably "what to do" was meant here?


Segher
