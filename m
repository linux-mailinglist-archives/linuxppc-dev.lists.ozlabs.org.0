Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 374535757B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 00:35:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkTpr1YXqz3c2T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 08:35:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkTpM4dYKz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 08:35:21 +1000 (AEST)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26EMXxH4022156;
	Thu, 14 Jul 2022 17:34:00 -0500
Message-ID: <cf219a215b2248d991d16d764212748976b855fa.camel@kernel.crashing.org>
Subject: Re: [PATCH] macintosh:fix oob read in do_adb_query function
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Ning Qiang <sohu0106@126.com>
Date: Fri, 15 Jul 2022 08:33:58 +1000
In-Reply-To: <20220713153734.2248-1-sohu0106@126.com>
References: <20220713153734.2248-1-sohu0106@126.com>
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
Cc: greg@kroah.com, security@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-07-13 at 23:37 +0800, Ning Qiang wrote:
> In do_adb_query function of drivers/macintosh/adb.c, req->data is
> copy
> form userland. the  parameter "req->data[2]" is Missing check, the
> array size of adb_handler[] is 16, so "adb_handler[
> req->data[2]].original_address" and "adb_handler[
> req->data[2]].handler_id" will lead to oob read.
> 
> Signed-off-by: Ning Qiang <sohu0106@126.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
>  drivers/macintosh/adb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/macintosh/adb.c b/drivers/macintosh/adb.c
> index 439fab4eaa85..1bbb9ca08d40 100644
> --- a/drivers/macintosh/adb.c
> +++ b/drivers/macintosh/adb.c
> @@ -647,7 +647,7 @@ do_adb_query(struct adb_request *req)
>  
>  	switch(req->data[1]) {
>  	case ADB_QUERY_GETDEVINFO:
> -		if (req->nbytes < 3)
> +		if (req->nbytes < 3 || req->data[2] >= 16)
>  			break;
>  		mutex_lock(&adb_handler_mutex);
>  		req->reply[0] = adb_handler[req-
> >data[2]].original_address;

