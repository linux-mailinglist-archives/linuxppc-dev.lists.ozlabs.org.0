Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 668415664B1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 10:07:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcZyh51hyz3c53
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 18:07:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcZyF5bmVz303t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 18:06:42 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26583P5K007156;
	Tue, 5 Jul 2022 03:03:26 -0500
Message-ID: <2a855bc631bfe308726f640fa84d3836fba280a7.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Update reviewers
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 05 Jul 2022 18:03:24 +1000
In-Reply-To: <20220629060817.2943966-1-mpe@ellerman.id.au>
References: <20220629060817.2943966-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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
Cc: paulus@samba.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-06-29 at 16:08 +1000, Michael Ellerman wrote:
> Christophe and Nick have been active in recent years on the mailing
> list
> and making contributions, add them as reviewers.
> 
> Paul and Ben are no longer actively reviewing powerpc patches, remove
> them from the reviewers, they're still on linuxppc-dev if needed.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1fc9ead83d2a..af4cfeec9d0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11345,8 +11345,8 @@ F:	drivers/macintosh/
>  
>  LINUX FOR POWERPC (32-BIT AND 64-BIT)
>  M:	Michael Ellerman <mpe@ellerman.id.au>
> -R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
> -R:	Paul Mackerras <paulus@samba.org>
> +R:	Nicholas Piggin <npiggin@gmail.com>
> +R:	Christophe Leroy <christophe.leroy@csgroup.eu>
>  L:	linuxppc-dev@lists.ozlabs.org
>  S:	Supported
>  W:	https://github.com/linuxppc/wiki/wiki

