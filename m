Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922ED7B4EB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 11:08:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nMX+58jl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RzZqt3MvKz3w8b
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Oct 2023 20:08:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nMX+58jl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RzZjJ4nmWz3wDW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Oct 2023 20:02:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A2D85CE0EA2;
	Mon,  2 Oct 2023 09:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE7CC433C8;
	Mon,  2 Oct 2023 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696237361;
	bh=smbdD+CUEQ4ahMF3RqsYVNHHjGroQxTTaWRgCAR/D24=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nMX+58jl6hq9UFJUHZd1tjzFPgSTOpSlydUnTfJQnD4JkBTo1W3OhKwdiqRz3OSHL
	 5qGb/GMTdZ1Zi7txcN44MpKcZqjCquccKdPkeOQfVVDMci/1xfBziuQgAa/1GdsgkO
	 fTB8auP7M3L0i1rXICcsdIgBp+nJtQayOSXiZzAY=
Date: Mon, 2 Oct 2023 11:02:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 04/15] tty: Remove now superfluous sentinel element from
 ctl_table array
Message-ID: <2023100252-plod-user-4504@gregkh>
References: <20230928-jag-sysctl_remove_empty_elem_drivers-v1-0-e59120fca9f9@samsung.com>
 <20230928-jag-sysctl_remove_empty_elem_drivers-v1-4-e59120fca9f9@samsung.com>
 <63e7a4fe-58c9-470e-84c2-dd92e76462ae@kernel.org>
 <4d7bf39e-e7f9-f497-13aa-73718456a653@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d7bf39e-e7f9-f497-13aa-73718456a653@csgroup.eu>
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
Cc: "j.granados@samsung.com" <j.granados@samsung.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, Steve Wahl <steve.wahl@hpe.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Clemens Ladisch <clemens@ladisch.de>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Phillip Potter <phil@philpotter.co.uk>, Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Jiri Slaby <jirislaby@kernel.org>, Russ Weight <russell.h.weight@intel.com>, Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Corey Minyard <minyard@acm.org>, Leon Romanovsky <leon@kernel.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, David Airlie <airlied@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Dexuan Cui <decui@microsoft.com>, "willy@infradead.org" <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-serial@vger.kernel.org" <linux-se
 rial@vger.kernel.org>, Doug Gilbert <dgilbert@interlog.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "josh@joshtriplett.org" <josh@joshtriplett.org>, Jani Nikula <jani.nikula@linux.intel.com>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>, Juergen Gross <jgross@suse.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Theodore Ts'o <tytso@mit.edu>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, "li
 nuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Robin Holt <robinmholt@gmail.com>, "David S. Miller" <davem@davemloft.net>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 02, 2023 at 08:47:53AM +0000, Christophe Leroy wrote:
> 
> 
> Le 02/10/2023 à 10:17, Jiri Slaby a écrit :
> > On 28. 09. 23, 15:21, Joel Granados via B4 Relay wrote:
> >> From: Joel Granados <j.granados@samsung.com>
> >>
> >> This commit comes at the tail end of a greater effort to remove the
> >> empty elements at the end of the ctl_table arrays (sentinels) which
> >> will reduce the overall build time size of the kernel and run time
> >> memory bloat by ~64 bytes per sentinel (further information Link :
> >> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
> >>
> >> Remove sentinel from tty_table
> >>
> >> Signed-off-by: Joel Granados <j.granados@samsung.com>
> >> ---
> >>   drivers/tty/tty_io.c | 3 +--
> >>   1 file changed, 1 insertion(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> >> index 8a94e5a43c6d..2f925dc54a20 100644
> >> --- a/drivers/tty/tty_io.c
> >> +++ b/drivers/tty/tty_io.c
> >> @@ -3607,8 +3607,7 @@ static struct ctl_table tty_table[] = {
> >>           .proc_handler    = proc_dointvec,
> >>           .extra1        = SYSCTL_ZERO,
> >>           .extra2        = SYSCTL_ONE,
> >> -    },
> >> -    { }
> >> +    }
> > 
> > Why to remove the comma? One would need to add one when adding a new entry?
> 
> Does it make any difference at all ?
> 
> In one case you have:
> 
> @xxxx
>   		something old,
>   	},
> +	{
> +		something new,
> +	},
>   }
> 
> In the other case you have:
> 
> @xxxx
>   		something old,
> + 	},
> +	{
> +		something new,
>   	}
>   }

Because that way it is obvious you are only touching the "something new"
lines and never have to touch the "something old" ones.

It's just a long-standing tradition in Linux, don't have an extra
character if you don't need it :)

thanks,

greg k-h
