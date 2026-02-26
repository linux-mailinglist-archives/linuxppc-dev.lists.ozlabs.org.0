Return-Path: <linuxppc-dev+bounces-17326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIteEqq5oGnClwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:22:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7741AFAEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:22:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMPYy3kcXz2xNT;
	Fri, 27 Feb 2026 08:22:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772140966;
	cv=none; b=e3lj1VUphTvLwr/NscL2/On8W0XVtNUGY/YLyMmrjwtCXVjsbEbhyLnsZFU+zQcBUy2YytthnqP7MdJ/rcFgiW6sGiASrNbKEDe7nCeslZv8kXPdwAa9XGnpV8+blss5APvYtdG7+SPJ6Ing9prTvL590LUlGT6p8FOKq64feIUknSO7/xuKvZ8ZV9YZLWLbAi7XISFWjhcmhblhUleJ2MPQ82J/SqgQovnHejuymvSuA90rhl2XCx+CHiFg53ZbmO9SZKjR0m2qBiQrmTAt+dYXvlUnXLtbU1+cOhken7VXlVaLWhI36wa+G/6NjPUJzXzbRLHGfUwp6sXQOiVnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772140966; c=relaxed/relaxed;
	bh=yGqvLmJPcaAOrxNOcjED3+65oW1c2BvUJPz46YCc8tw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q7MO0RYUbvxjIXqCHq6w0/6mdyHfM6nduoVs1dW14FjftA8Z6M/yCUEtMZ7YlH5iWF2zfXqkoiN/zSe4Zuzr4vCffRoQ4x+ByQoMQApfpYD15KDVN8cbz4BGN9hZpNVuBM9d4pjpz26WCbmUEY3oH+w51iBneAoZEIji9yxI10oRBVSSITnSgvvZyrafD72lThYw4wfu6lIstnrtB1k9uZfATbARVAUs4La5Y1JE+TzKRrNFgHcBTfVk0O8vwuUeyMkjAn5BW55SE0NaY03cS8vqFdrRvBiBG1dW5z33WC1FlZNKhs5hTQtXmLQUdPdLt4xW+gd24Mbz70oB+wvwUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=cnTX4RmC; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=cnTX4RmC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 2098 seconds by postgrey-1.37 at boromir; Fri, 27 Feb 2026 08:22:45 AEDT
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMPYx35QZz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 08:22:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=yGqvLmJPcaAOrxNOcjED3+65oW1c2BvUJPz46YCc8tw=;
	t=1772140965; x=1773350565; b=cnTX4RmCHxsI7Fc4bpv9IZcvIcOJ7DxehyPh4Y/ARPesRP+
	HpxmXQRfb8T/aBhfN6XjhFbbwJb0lzZNdJbqbuqQY9duVezSMeiA2/Jq453RqYYjOAZ8C6Bh2fcD2
	VbvcoOzz/rfP1MnReyan2L96W/a92+e0su+Asv7A6i4WyJxQQvsWxgzDcMT5NE9ADKBr9UmY0KbPx
	8UoGBDaJK363d9vaj+zPeuanPgfEd+izQt6WQVHVEoQ9qJnEW089LCx2T7LKhhwCLSuxoZ0E6Ef94
	6S/QXbZjnFouQ3FPM2a5LIEHpVVDukdggOq6raLJPrk1fqwlQixVaWhE9bvfSSwQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vviGq-00000002awX-0FUr;
	Thu, 26 Feb 2026 21:47:40 +0100
Message-ID: <05f10825418c4e8c12b96eaf9404e4e14ad63aaa.camel@sipsolutions.net>
Subject: Re: [PATCH v1] ALSA: aoa: Constify struct configfs_item_operations
 and configfs_group_operations
From: Johannes Berg <johannes@sipsolutions.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Jaroslav Kysela
	 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org
Date: Thu, 26 Feb 2026 21:47:38 +0100
In-Reply-To: <803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
References: 
	<803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sipsolutions.net,none];
	R_DKIM_ALLOW(-0.20)[sipsolutions.net:s=mail];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17326-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christophe.jaillet@wanadoo.fr,m:perex@perex.cz,m:tiwai@suse.com,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sound@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[wanadoo.fr,perex.cz,suse.com];
	FORGED_SENDER(0.00)[johannes@sipsolutions.net,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sipsolutions.net:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes@sipsolutions.net,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5B7741AFAEF
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 21:43 +0100, Christophe JAILLET wrote:
> 'struct codec_connection' are not modified in this driver.
>=20
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
>=20

The security claim seems like a stretch for this data, but I guess since
it's never modified making it const makes some sense.

johannes

