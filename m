Return-Path: <linuxppc-dev+bounces-12490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0212AB8DCF5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Sep 2025 16:53:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cV8PP3fKdz2ySb;
	Mon, 22 Sep 2025 00:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758450154;
	cv=none; b=mXV7Hz62mY3u98z9FMxb4O8AHdmmugovUosni3aQcFRvts04QUFWlCnDPH5W/ltNLGEmsdPhQjPL1pObbNVaMAqQjW/JvtHNakDHX2DB6XjmVC7hHucjFXF6YxbA/WFGogiUPNfn3pHTO9RlxGQssH2xLsoR69zKWd5iusgfE6nm+AeHUoXspbdN6Onw7wpM16VZ0rs8jYnoVuxZWgXs0yKdrm7PZiJo922ASUsCkc7FFFjexiCzg9c/X7lLXq4bJbxX5mXD3fJSI47Nh/tn+8YShB5Rw33bKxm51edKMmdVVhguSbvBAPOaV1mZNFqKu9M8Jg4QQILF2TS7gy+ziA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758450154; c=relaxed/relaxed;
	bh=z4dTzHicOmu0ud13rOeQ61ccyjqJXmSHMtbdd650m2s=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=mDtFQhZHsgLa3cmCr0TfS3V+vt1AEVJ6GJDwUZj3BQ1WapXr5w6b0gDCFyMYjOOde0362r6je0ny1+Za4aRMgSLyTdsngU4an8H0hAi10hqQvEssitKXQWb4st/iRAqTXJDVFSo98QuZDxZDiG2AjzOd/wY+kRflbWNtnapkqqI7tHZjqCULocfoN18HWucTdrnp1V42H6L4feDiBBjcVME7XDUtpbA91gT1rqfDnxjhUz880h+LhDw+Z9Mnt36DMkd85/HZoUdoPrzmj6wOLfgm49l+wsCpB9UB6bDyFOl99n/nNBWmAeghQ6GD7fWvDGRW69+V+G94TwRNlRDhQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; dkim=pass (2048-bit key; unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm1 header.b=suPlKyrD; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GeQRDIo/; dkim-atps=neutral; spf=pass (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=neilb@ownmail.net; receiver=lists.ozlabs.org) smtp.mailfrom=ownmail.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm1 header.b=suPlKyrD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=GeQRDIo/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ownmail.net (client-ip=103.168.172.158; helo=fhigh-a7-smtp.messagingengine.com; envelope-from=neilb@ownmail.net; receiver=lists.ozlabs.org)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cV2P302p8z30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 20:22:30 +1000 (AEST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 562C314000FC;
	Sun, 21 Sep 2025 06:22:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 21 Sep 2025 06:22:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
	1758450147; x=1758536547; bh=z4dTzHicOmu0ud13rOeQ61ccyjqJXmSHMtb
	dd650m2s=; b=suPlKyrDIIb3+IwNlbntYUFM9a0CpPFkrFNA265367EGvWcyL6g
	Ai3GxZx0x+4ArraDgo85aSSM6UQ4zzFGVA5VIEciOlSm3NNSWX25P5Y03QWE28I3
	CLe6f2VtSTdh4JJKb+G/1iqdVfzX0vAmv0rw3WzjY6AV5y90Gk3IeMMfARA36sOH
	HpJc25LV040BNWMua/br1P4ozNIqmfIxCFvLkngByr/O5d1WPsGJ3KRF4kkGQuB9
	S9eEzNsKbEG3NxPAg9XaP00LN2cp8jxFXUVLY3emc7MIrrwwoRA8u81v7iQcDmwB
	y1i85q2UsOjLlxCKTdi3KzV5btBgy0j8lkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758450147; x=
	1758536547; bh=z4dTzHicOmu0ud13rOeQ61ccyjqJXmSHMtbdd650m2s=; b=G
	eQRDIo/bVDytypOm19Nj87vmudllOQ9j3VlOHWvohikkIUe1MVoAnRfTnb6vhZG5
	p/cfn+Y69hQFq+LVxWZ+cDO0PRm78tF1WIHNftcRqY4jWKzNPYz/PYCASiN4T7dQ
	Ff0byzGrYNOTxv9a00wLEgh7Gxodwbti8lnoGpLU6lf/v6i1l7z0vb1Vww21tC7U
	K5yuRQ00OCVFDsDfZsOmzfTDSHTacSs4GGwG3NyiQgJvWadUrnUBAu+OrOJ+aYl6
	6m6TGOIv9j/d9/dL6Ak7LlYiyTg58SG9j90U7kwqG7mGOfPxJlTcpdXt+6/6EDcN
	eM/eiPVRXLdSFxgbW1jzg==
X-ME-Sender: <xms:4tHPaNn-6gqhyy2fn228rdPkVbYp_Ug6kGDDGg2DHA_UQqBKha9eUw>
    <xme:4tHPaOnAXRg9ewbcwMnOihWBSq0CcdpuYvlOUopk6I_0inPF1phzlafTbq6JWqCIc
    p6hDERGz-ekLA>
X-ME-Received: <xmr:4tHPaBvIC1wTbzMyk6Z6_pupiyb2-fdrDwS3wmltW5QQior3XvDjrxQFy5SPe20vXimLdad3qAUTV9KiHeJdEVBVTaKfgGCxDkhwN4vsSbQB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehgeejvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegtgfgghffvvefujghffffkrhesthhqredttddtjeenucfhrhhomheppfgvihhluehr
    ohifnhcuoehnvghilhgssehofihnmhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ffveejleejheeujeegheelleeuveduheejkeegveeuffetvefhfeevtdeuuefgjeenucff
    ohhmrghinhepghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnvghilhgssehofihnmhgr
    ihhlrdhnvghtpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepvhhirhhoseiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhfshguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdgtihhfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdgstggrtghhvghfshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    phhfsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgrtghksehsuhhsvg
    drtgii
X-ME-Proxy: <xmx:4tHPaIJcxLI3mylMD65vcVWusoP2ANC-YLZj18LljgYs_YDW3iCO8g>
    <xmx:4tHPaGgZA-AHazPVIA52TncFHJ17tXzJ_qghKTM5oUTHW75gg4Kr9g>
    <xmx:4tHPaEv6cEE7Fyvgf5R_3YeXxs9nKDVZb4dA2WqlhHve4Jshif9Q_w>
    <xmx:4tHPaIiKeeX1mmr-u8fMPJqBpiX9lJy-gb8Y3tvRhBYBzbFC7qYN4A>
    <xmx:49HPaJOA2ecx8oezZruDJjk7UiOe6Ag1tYRGEkvQOih3emkbW4M3hGxH>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 21 Sep 2025 06:22:22 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
From: NeilBrown <neilb@ownmail.net>
To: "kernel test robot" <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
 "Amir Goldstein" <amir73il@gmail.com>, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, linux-cifs@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jeff Layton" <jlayton@kernel.org>,
 "Jan Kara" <jack@suse.cz>, oliver.sang@intel.com
Subject:
 Re: [PATCH v3 5/6] VFS: rename kern_path_locked() and related functions.
In-reply-to: <202509211121.ebd9f4b0-lkp@intel.com>
References: <20250915021504.2632889-6-neilb@ownmail.net>,
 <202509211121.ebd9f4b0-lkp@intel.com>
Date: Sun, 21 Sep 2025 20:22:13 +1000
Message-id: <175845013376.1696783.14389036029721020068@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 21 Sep 2025, kernel test robot wrote:
>=20
> Hello,
>=20
> kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:
>=20
> commit: 747e356babd8bdd569320c29916470345afd3cf7 ("[PATCH v3 5/6] VFS: rena=
me kern_path_locked() and related functions.")
> url: https://github.com/intel-lab-lkp/linux/commits/NeilBrown/VFS-ovl-add-l=
ookup_one_positive_killable/20250915-101929
> base: https://git.kernel.org/cgit/linux/kernel/git/vfs/vfs.git vfs.all
> patch link: https://lore.kernel.org/all/20250915021504.2632889-6-neilb@ownm=
ail.net/
> patch subject: [PATCH v3 5/6] VFS: rename kern_path_locked() and related fu=
nctions.

This incremental fix should be sufficient.

Thanks,
NeilBrown


diff --git a/fs/namei.c b/fs/namei.c
index 5ceb971632fe..92973a7a8091 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -2772,7 +2772,7 @@ static struct dentry *__start_removing_path(int dfd, st=
ruct filename *name,
 	if (unlikely(type !=3D LAST_NORM))
 		return ERR_PTR(-EINVAL);
 	/* don't fail immediately if it's r/o, at least try to report other errors =
*/
-	error =3D mnt_want_write(path->mnt);
+	error =3D mnt_want_write(parent_path.mnt);
 	inode_lock_nested(parent_path.dentry->d_inode, I_MUTEX_PARENT);
 	d =3D lookup_one_qstr_excl(&last, parent_path.dentry, 0);
 	if (IS_ERR(d))
@@ -2789,7 +2789,7 @@ static struct dentry *__start_removing_path(int dfd, st=
ruct filename *name,
 unlock:
 	inode_unlock(parent_path.dentry->d_inode);
 	if (!error)
-		mnt_drop_write(path->mnt);
+		mnt_drop_write(parent_path.mnt);
 	return d;
 }
=20

