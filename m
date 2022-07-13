Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2A572C01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 05:47:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjNqk3vkcz3cdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 13:47:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjNqJ345Xz3bZB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 13:47:23 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26D3k4LK022660;
	Tue, 12 Jul 2022 22:46:05 -0500
Message-ID: <68b18cf30dc3fb4d78a74edf390fcc5da6f61114.camel@kernel.crashing.org>
Subject: Re: oob read in do_adb_query function
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: sohu0106 <sohu0106@126.com>
Date: Wed, 13 Jul 2022 13:46:04 +1000
In-Reply-To: <74db5889.1519.181f54412b2.Coremail.sohu0106@126.com>
References: <74db5889.1519.181f54412b2.Coremail.sohu0106@126.com>
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
Cc: =?UTF-8?Q?=E5=86=85=E6=A0=B8=E5=AE=89=E5=85=A8=E7=BB=84?= <security@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-07-13 at 09:54 +0800, sohu0106 wrote:
> 
> 
> In do_adb_query function of drivers/macintosh/adb.c, req->data is
> copy form userland. the  parameter "req->data[2]" is Missing check,
> the array size of adb_handler[] is 16, so "adb_handler[req-
> >data[2]].original_address" and "adb_handler[req-
> >data[2]].handler_id" will lead to oob read.

Thanks ! Can you send this with a proper Signed-off-by so we can apply
directly ?

Cheers,
Ben.
> 
> 
> diff --git a/adb.c b/adb.c_patch
> index 73b3961..8a5604b 100644
> --- a/adb.c
> +++ b/adb.c_patch
> @@ -647,7 +647,7 @@ do_adb_query(struct adb_request *req)
> 
> 
>         switch(req->data[1]) {
>         case ADB_QUERY_GETDEVINFO:
> -               if (req->nbytes < 3)
> +               if (req->nbytes < 3 || req->data[2] > 16)
>                         break;
>                 mutex_lock(&adb_handler_mutex);
>                 req->reply[0] = adb_handler[req-

