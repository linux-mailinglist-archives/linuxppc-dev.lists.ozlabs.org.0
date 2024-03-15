Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29B87CD2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 13:20:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l/e5XwYQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PBLRRzks;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l/e5XwYQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PBLRRzks;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tx3Hn1crgz3vX6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 23:20:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l/e5XwYQ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PBLRRzks;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=l/e5XwYQ;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=PBLRRzks;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tx3Gz73Tpz3cP7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 23:20:11 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4C12E1FB63;
	Fri, 15 Mar 2024 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710505206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
	b=l/e5XwYQbWLxydmcJ3dP3h+TmZMhT1FLZriFlvKl3dO83ajywTRQZDoTGzQ6d37zYbpvX8
	j9HGF0DluKgK6SNCI3JeITcXniTDi/NGpVn02KIxbEYg76EHdjf9QLo8rSMv2e4s7QFrr1
	ULg98ZIPcFCZCX3QQelfGEN9v0BaH20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710505206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
	b=PBLRRzksiC1Lnz0/B1TnDNaDkpBm4oUnKH/33HfX9HG0In1bcThlAiMzrHMKAYNKIP6sOI
	WLEEVnH1KpyoexDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1710505206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
	b=l/e5XwYQbWLxydmcJ3dP3h+TmZMhT1FLZriFlvKl3dO83ajywTRQZDoTGzQ6d37zYbpvX8
	j9HGF0DluKgK6SNCI3JeITcXniTDi/NGpVn02KIxbEYg76EHdjf9QLo8rSMv2e4s7QFrr1
	ULg98ZIPcFCZCX3QQelfGEN9v0BaH20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1710505206;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=8XXc0JqGcqWsrbseMRyzJOlPdGAmOX3WbaUBfA2wjAE=;
	b=PBLRRzksiC1Lnz0/B1TnDNaDkpBm4oUnKH/33HfX9HG0In1bcThlAiMzrHMKAYNKIP6sOI
	WLEEVnH1KpyoexDg==
Date: Fri, 15 Mar 2024 13:20:05 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
	"Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org
Subject: Cannot load wireguard module
Message-ID: <20240315122005.GG20665@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.47
X-Spamd-Result: default: False [-0.47 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 R_MIXED_CHARSET(0.83)[subject];
	 BAYES_HAM(-0.00)[43.28%]
X-Spam-Flag: NO
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I cannot load the wireguard module.

Loading the module provides no diagnostic other than 'No such device'.

Please provide maningful diagnostics for loading software-only driver,
clearly there is no particular device needed.

Thanks

Michal

jostaberry-1:~ # uname -a
Linux jostaberry-1 6.8.0-lp155.8.g7e0e887-default #1 SMP Wed Mar 13 09:02:21 UTC 2024 (7e0e887) ppc64le ppc64le ppc64le GNU/Linux
jostaberry-1:~ # modprobe wireguard
modprobe: ERROR: could not insert 'wireguard': No such device
jostaberry-1:~ # modprobe -v wireguard
insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko.zst 
modprobe: ERROR: could not insert 'wireguard': No such device
jostaberry-1:~ # modprobe chacha-generic
jostaberry-1:~ # modprobe -v wireguard
insmod /lib/modules/6.8.0-lp155.8.g7e0e887-default/kernel/arch/powerpc/crypto/chacha-p10-crypto.ko.zst 
modprobe: ERROR: could not insert 'wireguard': No such device
jostaberry-1:~ # 

