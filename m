Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFD57F80B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 03:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrjdG46gqz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrjct1wrjz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 11:48:45 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26P1kWCd023262;
	Sun, 24 Jul 2022 20:46:32 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26P1kWUV023261;
	Sun, 24 Jul 2022 20:46:32 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sun, 24 Jul 2022 20:46:31 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: wangjianli <wangjianli@cdjrlc.com>
Subject: Re: [PATCH] powerpc/mm: fix repeated words in comments
Message-ID: <20220725014631.GS25951@gate.crashing.org>
References: <20220724063622.3205-1-wangjianli@cdjrlc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724063622.3205-1-wangjianli@cdjrlc.com>
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

On Sun, Jul 24, 2022 at 02:36:22PM +0800, wangjianli wrote:
>  Delete the redundant word 'so'.

>  	/* It would be nice if this was a BUILD_BUG_ON(), but at the
>  	 * moment, gcc doesn't seem to recognize is_power_of_2 as a
> -	 * constant expression, so so much for that. */
> +	 * constant expression, so much for that. */

It is not redundant here.  The first "so" means "therefore", and the
second "so" means "to such a great extent".


Segher
