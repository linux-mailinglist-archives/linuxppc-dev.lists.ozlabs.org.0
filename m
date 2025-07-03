Return-Path: <linuxppc-dev+bounces-10073-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876EAAF69CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 07:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXlpl2GPMz2yhb;
	Thu,  3 Jul 2025 15:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751520927;
	cv=none; b=fZQg0DpRaXRT2Y3EQXdmrXB0AGk6vi0VqREFEtEsb9DrPbPNibzEu9tHEBCw/4SOqTMDqFoyC6sZ4RPDbXdSpKLbhdxvgpAQpnKjHXL46KmeUx8T0feYVAgUvLju34bXzx7GqJ9X3I0M1Xe0uovuPrSqTkH3SNFWhrpliFu2CQqnvk+8jvDvP0vUTYD74ku6Wt7S+mhILoNyXWs8xXwOmfgU9dR90TeMWoIkRvNxFLl5UOjwLUxShKZC3n5eywqVbU/4a7r+jdTBZxh9EfHFYEdQCCoCmmbksAwnd95pgyCShHsR2mvpsG4pmj3yfr6Qup0Yu94dF9z5/qJwAvmyqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751520927; c=relaxed/relaxed;
	bh=5IOOAbvWo5dzaLXtAHKLkZZANgdtRykhR427La9wiBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6Zu4sSRuQxzDnGLfUERO1NGmE/uLhfiu69HTvDk23X+wkl6WuA+RZkqeGW0jNRl3E36ROkjGFJ4pUBxXWDaNsJ63iuOX6uvH6XsClRqoRdqX/n9CH2XQGFgjD3UnQajun9tCphRKI3jm7VpWrGN587QOXRZ23yQcEWnVgcG0jvCbmY7jWoabFqss5zxbpnp/VnUi4zYF64KBlR2M7Dwp/KECSe4XxQxUxGLge25wtaPIW25gtBR4ZduM9i/GCCdAPvyvZWWbhrWzfYY+YhVUV5GNGvpXBCNpclup044MynoEaww8zo/lS4rzM0vimmOVUCK2QFPzeLuTJ2NLSSA9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HfCg6gJE; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HfCg6gJE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXlpk3WGRz2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 15:35:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14B6644299;
	Thu,  3 Jul 2025 05:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EE4C4CEE3;
	Thu,  3 Jul 2025 05:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751520922;
	bh=yeYg6l7jpX2wUFOOLFtqLbrA40KVIjwHufhNi0OeZVw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfCg6gJEBBc2fdKMY/VjDjPSARvBed6UCnQS+loRwZyyd4AMNSAZydmhWRmqLuks7
	 LhfMbj52p6Q5Hw5ouwXsPMac14p6bu0ENd67wqa9yAWpFj340XhQ3vVUj/6ljx3wJd
	 o8ZRw+ge1GE33MF4wUQMaWgxZZB83olM/EydLA/w=
Date: Thu, 3 Jul 2025 07:35:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ahelenia =?utf-8?Q?Ziemia=C5=84ska?= <nabijaczleweli@nabijaczleweli.xyz>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chas Williams <3chas3@gmail.com>, Coly Li <colyli@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Jeroen de Borst <jeroendb@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Don Brace <don.brace@microchip.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Jiri Slaby <jirislaby@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-sh@vger.kernel.org, netdev@vger.kernel.org,
	linux-bcache@vger.kernel.org, storagedev@microchip.com,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net
Subject: Re: [PATCH] global: fix misapplications of "awhile"
Message-ID: <2025070300-return-removable-7277@gregkh>
References: <h2ieddqja5jfrnuh3mvlxt6njrvp352t5rfzp2cvnrufop6tch@tarta.nabijaczleweli.xyz>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <h2ieddqja5jfrnuh3mvlxt6njrvp352t5rfzp2cvnrufop6tch@tarta.nabijaczleweli.xyz>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 02, 2025 at 09:32:45PM +0200, Ahelenia Ziemiańska wrote:
> Of these:
>   7 "for a while" typos
>   5 "take a while" typos
>   1 misreading of "once in a while"?
> 
> 3 awhiles used correctly remain in the tree
> 
> Signed-off-by: Ahelenia Ziemiańska <nabijaczleweli@nabijaczleweli.xyz>

Please properly break your patch up into one-per-subsystem and submit it
that way.

thanks,

greg k-h

