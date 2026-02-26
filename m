Return-Path: <linuxppc-dev+bounces-17321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNYsNdWzoGmHlwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:57:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D62431AF563
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMP1D4VMqz2yY0;
	Fri, 27 Feb 2026 07:57:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.80
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772139472;
	cv=none; b=TF9LZ7Sl3JIN7at7044kgdUcCA7vpjxzr1f9VLTIjKl5AL0BlW+rNNj0zBtHRPlf6RL6azVG9qnRD27TS+77CI6YeLdID5RiGWLRFceQ46B6CD6rdyHL6S1S1F2rJzErxPz49cmGXwb2ig6wU/cumcuSYUBdkK+dZr6tMeymCpdC6cPbUUwTgUhlFB7w8OuJJXwhR1D9VylsGHMcmjSPNTuGj39aPvWskFDzDcUN7oFltcu4gLPltebjbhWOztONFHSe1qY25eipicSh9vCc7n38y2aAgxCRE+kLeflIEWtKlab+rqzjoVL4RnYUaKHIuWcI1WOva/aSYrwlkXdaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772139472; c=relaxed/relaxed;
	bh=XNvxEZUCBvpU8JwtRc1bKvRe9HjTkA50spCCWeLolOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zsjh7USseY+MKkcDSgkx35+q48JLj8yYkZMpc0rlD5OjQemVKOUJWytjrKbl4MO9HLobI14YlKd+qOMDiNBEoTTLJchxpauvbfJkEgyuiyToo2l4gh7DvxBZn03e2y1wG/Jvzw1Su+aA2O2o+pVPCR6IRKrqR5sEZBkxrNlFr91IZQ0bTEw65IRARcUcO6Om1wsyPYdWkYkj/l/3D6e9rXX/f/q6/zmXbcsD6l3JYi5fOoatHLSPvhsXAdiUS8ZExyXbRl2UT5pDTVV89nRNy1VQVyjyL46WmKvrtTApemb32sSoGKfCQTsM3JonW6ks4L7zf6Va5pXyf9qDPdeN0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=Ppx8My7D; dkim-atps=neutral; spf=pass (client-ip=80.12.242.80; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=Ppx8My7D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.80; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 783 seconds by postgrey-1.37 at boromir; Fri, 27 Feb 2026 07:57:50 AEDT
Received: from smtp.smtpout.orange.fr (smtp-80.smtpout.orange.fr [80.12.242.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMP1B4Wjmz2yLG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 07:57:50 +1100 (AEDT)
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id viPYv6Djy0h1yviPYvQ3lF; Thu, 26 Feb 2026 21:56:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772139402;
	bh=XNvxEZUCBvpU8JwtRc1bKvRe9HjTkA50spCCWeLolOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Ppx8My7DW0Tash6fRof9n4+6lWDa8ewK0KusdITyWFkaucykY9/lauiR5Qbu+VhOa
	 LJGQfSqFqNuVnSe7Yuhui2umVN4S7U1CeR77+cFPI16j8ixG61vjMIEZk3srFmdFxx
	 K0d+Ttk9Ccq6ORR3jG0rC/Bvyma32ZRQW/DW4it3UwYqBf78O9XQ47eDx5OFw4jmC1
	 rCQetJ5bua+Ccvk/cqOJJVO6KOWOopEr16NkfP207QpU+49Alj6btvqV8E92ovDInl
	 Z8zf6M4Fm0JcLCkDeypupyMUA0jmb7LeDL3O01Ak7xXGIOgWZjXM66zuATDna+VAIY
	 2zwrmkaixMynw==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Feb 2026 21:56:42 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <61cece55-8ab1-4146-a3f5-a2b5d97adc66@wanadoo.fr>
Date: Thu, 26 Feb 2026 21:56:39 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ALSA: aoa: Constify struct configfs_item_operations
 and configfs_group_operations
To: Johannes Berg <johannes@sipsolutions.net>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org
References: <803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
 <05f10825418c4e8c12b96eaf9404e4e14ad63aaa.camel@sipsolutions.net>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <05f10825418c4e8c12b96eaf9404e4e14ad63aaa.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17321-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johannes@sipsolutions.net,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[christophe.jaillet@wanadoo.fr,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.jaillet@wanadoo.fr,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D62431AF563
X-Rspamd-Action: no action

Le 26/02/2026 à 21:47, Johannes Berg a écrit :
> On Thu, 2026-02-26 at 21:43 +0100, Christophe JAILLET wrote:
>> 'struct codec_connection' are not modified in this driver.
>>
>> Constifying these structures moves some data to a read-only section, so
>> increases overall security.
>>
> 
> The security claim seems like a stretch for this data, but I guess since
> it's never modified making it const makes some sense.

You are right, in this case the security claim is a bit too much.
I use the same template for all such patches, and some times, it is less 
relevant.

The claim makes much more sense when the struct has some function pointers.


Please not the the subject is broken (configfs_item_operations...)
I've sent the same patch with the correct subject.
Sorry for the noise.

CJ


> 
> johannes
> 
> 


