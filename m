Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FAA37F579
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 12:17:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgndR4NQGz307T
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 20:16:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fgnd451n6z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 20:16:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fgncz44FZz9sch;
 Thu, 13 May 2021 12:16:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elzAeS9dJuuJ; Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fgncz368bz9scg;
 Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 313FE8B7F3;
 Thu, 13 May 2021 12:16:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R8jvyF-796Mk; Thu, 13 May 2021 12:16:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B59358B76C;
 Thu, 13 May 2021 12:16:34 +0200 (CEST)
Subject: Re: [PATCH 8/8] xen/hvc: replace BUG_ON() with negative return value
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-9-jgross@suse.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6da4cc91-ccde-fce8-707c-e7544783c2fa@csgroup.eu>
Date: Thu, 13 May 2021 12:16:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513100302.22027-9-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/05/2021 à 12:03, Juergen Gross a écrit :
> Xen frontends shouldn't BUG() in case of illegal data received from
> their backends. So replace the BUG_ON()s when reading illegal data from
> the ring page with negative return values.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   drivers/tty/hvc/hvc_xen.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> index 92c9a476defc..30d7ffb1e04c 100644
> --- a/drivers/tty/hvc/hvc_xen.c
> +++ b/drivers/tty/hvc/hvc_xen.c
> @@ -86,6 +86,11 @@ static int __write_console(struct xencons_info *xencons,
>   	cons = intf->out_cons;
>   	prod = intf->out_prod;
>   	mb();			/* update queue values before going on */
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->out),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;
> +
>   	BUG_ON((prod - cons) > sizeof(intf->out));

Why keep the BUG_ON() ?


>   
>   	while ((sent < len) && ((prod - cons) < sizeof(intf->out)))
> @@ -114,7 +119,10 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
>   	 */
>   	while (len) {
>   		int sent = __write_console(cons, data, len);
> -		
> +
> +		if (sent < 0)
> +			return sent;
> +
>   		data += sent;
>   		len -= sent;
>   
> @@ -138,7 +146,10 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
>   	cons = intf->in_cons;
>   	prod = intf->in_prod;
>   	mb();			/* get pointers before reading ring */
> -	BUG_ON((prod - cons) > sizeof(intf->in));
> +
> +	if (WARN_ONCE((prod - cons) > sizeof(intf->in),
> +		      "Illegal ring page indices"))
> +		return -EINVAL;
>   
>   	while (cons != prod && recv < len)
>   		buf[recv++] = intf->in[MASK_XENCONS_IDX(cons++, intf->in)];
> 
