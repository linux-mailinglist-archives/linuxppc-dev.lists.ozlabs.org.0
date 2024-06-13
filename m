Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6814090733A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 15:13:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mt4IuKc5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0NCD2Fq7z3cX8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 23:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mt4IuKc5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0NBT1B34z3cT8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:13:03 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52c8973ff29so1028274e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 06:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718284380; x=1718889180; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H4qMOlVAmB1+8562nApjJnNhlZQHZLqU1OXBwVXRF78=;
        b=mt4IuKc5ra9JdtNGLXm/JsRAYyayAx/bsSC/tvfJX8NAlo+pr5mY6q2vzaYn4eYY1+
         yXREZZNEC7pZo1Xy4Oo696jZSgzkjz1a0Sm/2+dCebArFmpPpLmFgLPB30Xd2l4hY2/w
         bNjBPUPT0vRMbSm2tgslfBPcjUbVmAMcvO98tXcI2W1NrjZrbAGnZHBQv8rD9wol2U3m
         LZuXs/8IcpiWWv8gdDmYSOTrb6sxZ3rqcPJCbf3/7b86thn+R1xtDPJ8s2r0fip7CWE8
         tLRHAoRq3BQgeHyRH0nwB/kIuhtz+7R9kbzSVo2/x5wmHgYcC5w9DI2ruw0ZYl7HXhyA
         76VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718284380; x=1718889180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4qMOlVAmB1+8562nApjJnNhlZQHZLqU1OXBwVXRF78=;
        b=Tqvsn+bZD194a03lF4qauH03n9ZZyUH4aNPog7TBXzvYBuMpmXBcrG/uL00CXbsF3K
         hX1mu7Msf85AMooc1aJS8nr/sfk/CE7TO6Wn8kvxPN/E8wGP5gRz0AIl6Z2i0hJFyJIe
         I0PAJlcZm5x4ZOMg4NoTRGs1u+9wMnmkPLV4ru1srYKKbGbQ+dhE2JJBXwSYVNCy5OUO
         6+DZIrCLhhzTKgjH66jnJSZkHM6sNsfOfK/qEhi71ORUXu0NfrtgUld8HL9fxoOtMhzT
         QphSn/fwU+nYusctxwu1fi6wEC2oTTYhXNVam0SbB3X/iX70uKd+7UlOOd0n8AWxtvmf
         fq3g==
X-Forwarded-Encrypted: i=1; AJvYcCUkj27k6GlMJ6OaH4HHsR2t8qAzdgny9iuOKN8i6AfmgSLQDc/9Ql2LnTfEJjReg00qwVjGRqIUTWZS8DpViMSqCYL4YRPvAhfiifGaeQ==
X-Gm-Message-State: AOJu0YxOzP/FsL5agrMZFpKNfmx1RaOOQ5F5vnoBCYvKQPnk/pocDsE3
	GaqIzToyTWNc1Ae6h7YpYaL7rhSDvAAqMbOaqOHGnSDvjFD7Y0ETejUZPGOY
X-Google-Smtp-Source: AGHT+IFNjIqLDbiiJvyVQ+CTYUUPuuKLx47d3/3uk6kw1RXtVGPymnVcCEA7pTqKhgYonTHLU10trQ==
X-Received: by 2002:a2e:878f:0:b0:2eb:ecba:444a with SMTP id 38308e7fff4ca-2ebfc9fac80mr27236611fa.23.1718284018170;
        Thu, 13 Jun 2024 06:06:58 -0700 (PDT)
Received: from pc636 (host-90-233-218-141.mobileonline.telia.com. [90.233.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c05f56sm2099851fa.42.2024.06.13.06.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 06:06:57 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 13 Jun 2024 15:06:54 +0200
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <Zmru7hhz8kPDPsyz@pc636>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <ZmrfA1p2zSVIaYam@zx2c4.com>
 <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80e03b02-7e24-4342-af0b-ba5117b19828@paulmck-laptop>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, kernel-janitors@vger.kernel.org, Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, linux-trace-kernel@vger.kernel.org, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, linux-block@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 05:47:08AM -0700, Paul E. McKenney wrote:
> On Thu, Jun 13, 2024 at 01:58:59PM +0200, Jason A. Donenfeld wrote:
> > On Wed, Jun 12, 2024 at 03:37:55PM -0700, Paul E. McKenney wrote:
> > > On Wed, Jun 12, 2024 at 02:33:05PM -0700, Jakub Kicinski wrote:
> > > > On Sun,  9 Jun 2024 10:27:12 +0200 Julia Lawall wrote:
> > > > > Since SLOB was removed, it is not necessary to use call_rcu
> > > > > when the callback only performs kmem_cache_free. Use
> > > > > kfree_rcu() directly.
> > > > > 
> > > > > The changes were done using the following Coccinelle semantic patch.
> > > > > This semantic patch is designed to ignore cases where the callback
> > > > > function is used in another way.
> > > > 
> > > > How does the discussion on:
> > > >   [PATCH] Revert "batman-adv: prefer kfree_rcu() over call_rcu() with free-only callbacks"
> > > >   https://lore.kernel.org/all/20240612133357.2596-1-linus.luessing@c0d3.blue/
> > > > reflect on this series? IIUC we should hold off..
> > > 
> > > We do need to hold off for the ones in kernel modules (such as 07/14)
> > > where the kmem_cache is destroyed during module unload.
> > > 
> > > OK, I might as well go through them...
> > > 
> > > [PATCH 01/14] wireguard: allowedips: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> > > 	Needs to wait, see wg_allowedips_slab_uninit().
> > 
> > Also, notably, this patch needs additionally:
> > 
> > diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
> > index e4e1638fce1b..c95f6937c3f1 100644
> > --- a/drivers/net/wireguard/allowedips.c
> > +++ b/drivers/net/wireguard/allowedips.c
> > @@ -377,7 +377,6 @@ int __init wg_allowedips_slab_init(void)
> > 
> >  void wg_allowedips_slab_uninit(void)
> >  {
> > -	rcu_barrier();
> >  	kmem_cache_destroy(node_cache);
> >  }
> > 
> > Once kmem_cache_destroy has been fixed to be deferrable.
> > 
> > I assume the other patches are similar -- an rcu_barrier() can be
> > removed. So some manual meddling of these might be in order.
> 
> Assuming that the deferrable kmem_cache_destroy() is the option chosen,
> agreed.
>
<snip>
void kmem_cache_destroy(struct kmem_cache *s)
{
	int err = -EBUSY;
	bool rcu_set;

	if (unlikely(!s) || !kasan_check_byte(s))
		return;

	cpus_read_lock();
	mutex_lock(&slab_mutex);

	rcu_set = s->flags & SLAB_TYPESAFE_BY_RCU;

	s->refcount--;
	if (s->refcount)
		goto out_unlock;

	err = shutdown_cache(s);
	WARN(err, "%s %s: Slab cache still has objects when called from %pS",
	     __func__, s->name, (void *)_RET_IP_);
...
	cpus_read_unlock();
	if (!err && !rcu_set)
		kmem_cache_release(s);
}
<snip>

so we have SLAB_TYPESAFE_BY_RCU flag that defers freeing slab-pages
and a cache by a grace period. Similar flag can be added, like
SLAB_DESTROY_ONCE_FULLY_FREED, in this case a worker rearm itself
if there are still objects which should be freed.

Any thoughts here?

--
Uladzislau Rezki
