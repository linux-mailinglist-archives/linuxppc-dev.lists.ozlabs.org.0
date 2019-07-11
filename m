Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C266B651FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 08:50:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kmry6GxRzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 16:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=neutral (mailfrom) smtp.mailfrom=lip6.fr
 (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr;
 envelope-from=julia.lawall@lip6.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lip6.fr
X-Greylist: delayed 68 seconds by postgrey-1.36 at bilbo;
 Thu, 11 Jul 2019 16:48:30 AEST
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kmq23sljzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 16:48:30 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.63,476,1557180000"; d="scan'208";a="313140146"
Received: from vaio-julia.rsr.lip6.fr ([132.227.76.33])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jul 2019 08:47:00 +0200
Date: Thu, 11 Jul 2019 08:46:56 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: wen.yang99@zte.com.cn
Subject: Re: Coccinelle: Checking of_node_put() calls with SmPL
In-Reply-To: <201907111435459627761@zte.com.cn>
Message-ID: <alpine.DEB.2.20.1907110845551.3626@hadrien>
References: 201907101533443009168@zte.com.cn,
 9d515026-5b74-cf0c-0c64-4fe242d4104e@web.de
 <201907111435459627761@zte.com.cn>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=====_001_next====="
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
Cc: wang.yi59@zte.com.cn, linux-pm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, oss@buserror.net, Markus.Elfring@web.de,
 xue.zhihong@zte.com.cn, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 cheng.shengyu@zte.com.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=====_001_next=====
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Thu, 11 Jul 2019, wen.yang99@zte.com.cn wrote:

> > > we developed a coccinelle script to detect such problems.
> >
> > Would you find the implementation of the function “dt_init_idle_driver”
> > suspicious according to discussed source code search patterns?
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/cpuidle/dt_idle_states.c?id=e9a83bd2322035ed9d7dcf35753d3f984d76c6a5#n208
> > https://elixir.bootlin.com/linux/v5.2/source/drivers/cpuidle/dt_idle_states.c#L208
> >
> >
> > > This script is still being improved.
> >
> > Will corresponding software development challenges become more interesting?
>
> Hello Markus,
> This is the simplified code pattern for it:
>
> 172         for (i = 0; ; i++) {
> 173                 state_node = of_parse_phandle(...);     ---> Obtain here
> ...
> 177                 match_id = of_match_node(matches, state_node);
> 178                 if (!match_id) {
> 179                         err = -ENODEV;
> 180                         break;                         --->  Jump out of the loop without releasing it
> 181                 }
> 182
> 183                 if (!of_device_is_available(state_node)) {
> 184                         of_node_put(state_node);
> 185                         continue;                    --->  Release the object references within a loop
> 186                 }
> ...
> 208                 of_node_put(state_node);  -->  Release the object references within a loop
> 209         }
> 210
> 211         of_node_put(state_node);       -->    There may be double free here.
>
> This code pattern is very interesting and the coccinelle software should also recognize this pattern.

In my experience, when you start looking at these of_node_put things, all
sorts of strange things appear...

julia
--=====_001_next=====--
