Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F39EB512F6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:33:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpr5c657Vz3bqg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 19:33:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bSdVaS0y;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bSdVaS0y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pabeni@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bSdVaS0y; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bSdVaS0y; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpr4r24Gmz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 19:32:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651138358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OG6hUPY6sAUTqTJViKJ1E1LWjNyEwooQAig3aG1iSlg=;
 b=bSdVaS0yvXXpcbDElCVtDBaDx0k1hLCEBJ30qU6Th/pqqSu19XujxA1FEMqmwRtlmyyEwJ
 YLVSf6reCB8icoY9UilVO5q9FfpYCGyxGTyOgO93umwDCBspKUgGPTFf7DyWzODfM31bh8
 1cFarfsOSA5R9Qh58WE7Xddpipg+Po4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651138358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OG6hUPY6sAUTqTJViKJ1E1LWjNyEwooQAig3aG1iSlg=;
 b=bSdVaS0yvXXpcbDElCVtDBaDx0k1hLCEBJ30qU6Th/pqqSu19XujxA1FEMqmwRtlmyyEwJ
 YLVSf6reCB8icoY9UilVO5q9FfpYCGyxGTyOgO93umwDCBspKUgGPTFf7DyWzODfM31bh8
 1cFarfsOSA5R9Qh58WE7Xddpipg+Po4=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-kdE2vY5yMmSUiUkBP7AKzA-1; Thu, 28 Apr 2022 05:32:37 -0400
X-MC-Unique: kdE2vY5yMmSUiUkBP7AKzA-1
Received: by mail-qv1-f70.google.com with SMTP id
 eo13-20020ad4594d000000b004466661ece9so3294986qvb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=OG6hUPY6sAUTqTJViKJ1E1LWjNyEwooQAig3aG1iSlg=;
 b=L7DGEo8Guh6aGq97bcMWxbVcG04YiguaGkOxdw80SFpV9122kQUTyLvdg0LqoujS9R
 PSHhPIqWxfvvSTDBwccU1y4NAnFxJoQl+SxNFBIsAWoZQONKCLDSNStx6mgJZ3a/Q+rO
 suZxg+YMM1E1uRQ70IekNugYYWhIaDosQiTVH3Qs4SPk5olDtFhuySNLGtoTNRNNap0S
 YbB7wh9kI7dcn6q4+NFWSSHBzzez1PwfYSQ1ovgo1v4uVUVC21F7ZWLNa9Hh0Cr92pr+
 GdG+g4KgaLfr1WWvgcKogN3ni1aimBBxgNmTJFe/z9M4lqi0i54BFygKtflGuO7T0TJX
 J/Mw==
X-Gm-Message-State: AOAM532kGSNC+3OiwdzHa3LBPktvpAXwRTotQ58uuwdb0eYth2ONv2eW
 CrsungFCo2QJhD2rr6xQK0L0DvmgjZmoSoSA2PAVcHk3bHxK8GnQsxclkMZNwNh/3lc1iC0LgX2
 4aD/D2RDhDOL3Q0uTmIUeMWK6CA==
X-Received: by 2002:a05:622a:2cb:b0:2f3:646b:54b6 with SMTP id
 a11-20020a05622a02cb00b002f3646b54b6mr15456787qtx.380.1651138356478; 
 Thu, 28 Apr 2022 02:32:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJ3J0ImF+LM/cJTr/TdEmv6YBtIqlv1bBiDK6w9j0coe0CvNV+LL3YO5hh7fcCBb3x5O7y0w==
X-Received: by 2002:a05:622a:2cb:b0:2f3:646b:54b6 with SMTP id
 a11-20020a05622a02cb00b002f3646b54b6mr15456733qtx.380.1651138356147; 
 Thu, 28 Apr 2022 02:32:36 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-117-160.dyn.eolo.it.
 [146.241.117.160]) by smtp.gmail.com with ESMTPSA id
 k66-20020a37ba45000000b0069c5adb2f2fsm9620433qkf.6.2022.04.28.02.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 02:32:35 -0700 (PDT)
Message-ID: <c499d01d51095ae338cbc63179bdc0e1606cbfef.camel@redhat.com>
Subject: Re: [PATCH net-next v5 08/18] net: sparx5: Replace usage of found
 with dedicated list iterator variable
From: Paolo Abeni <pabeni@redhat.com>
To: Jakob Koschel <jakobkoschel@gmail.com>, "David S. Miller"
 <davem@davemloft.net>
Date: Thu, 28 Apr 2022 11:32:28 +0200
In-Reply-To: <20220427160635.420492-9-jakobkoschel@gmail.com>
References: <20220427160635.420492-1-jakobkoschel@gmail.com>
 <20220427160635.420492-9-jakobkoschel@gmail.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, Yonghong Song <yhs@fb.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Martin Habets <habetsm.xilinx@gmail.com>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Edward Cree <ecree.xilinx@gmail.com>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, 2022-04-27 at 18:06 +0200, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
> 
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable instead of a
> found boolean [1].
> 
> This removes the need to use a found variable and simply checking if
> the variable was set, can determine if the break/goto was hit.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  .../microchip/sparx5/sparx5_mactable.c        | 25 +++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
> index a5837dbe0c7e..bb8d9ce79ac2 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
> @@ -362,8 +362,7 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
>  				     unsigned char mac[ETH_ALEN],
>  				     u16 vid, u32 cfg2)
>  {
> -	struct sparx5_mact_entry *mact_entry;
> -	bool found = false;
> +	struct sparx5_mact_entry *mact_entry = NULL, *iter;
>  	u16 port;
>  
>  	if (LRN_MAC_ACCESS_CFG_2_MAC_ENTRY_ADDR_TYPE_GET(cfg2) !=
> @@ -378,28 +377,28 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
>  		return;
>  
>  	mutex_lock(&sparx5->mact_lock);
> -	list_for_each_entry(mact_entry, &sparx5->mact_entries, list) {
> -		if (mact_entry->vid == vid &&
> -		    ether_addr_equal(mac, mact_entry->mac)) {
> -			found = true;
> -			mact_entry->flags |= MAC_ENT_ALIVE;
> -			if (mact_entry->port != port) {
> +	list_for_each_entry(iter, &sparx5->mact_entries, list) {
> +		if (iter->vid == vid &&
> +		    ether_addr_equal(mac, iter->mac)) {

I'm sorry for the late feedback.

If you move the 'mact_entry = iter;' statement here, the diffstat will
be slightly smaller and the patch more readable, IMHO.

There is similar situation in the next patch.

Cheers,

Paolo

