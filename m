Return-Path: <linuxppc-dev+bounces-1624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13C987076
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 11:42:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDpXn39cDz2yYn;
	Thu, 26 Sep 2024 19:42:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727343737;
	cv=none; b=S0/h+wnjTKMe5xqVrAy4112lC3tupp6Wlf1LjzsPwSAo01KCf3cHidZfFUVJtSAxQE/AgO6nKbyFUYH/6JEF8Z1z0pXwxCnQJ9A+BsaqZ0xnof/ibL5cIWdy+JnjG4F9qRlzOpwHisrnjZY1rt7OHK4zg9VwU400V8KRvBYLfG2MHzwy6m/4jBruiQPdR6ALrLW3db2c1Ql6OQnoEKvxh+4wYGvjc+2w66suSnqeBVgKZ0cERQ8PANK45yIK+zL+F6BGNEKHQ20ncqR+bhjgct86Hc35mlcO3xnztEC3U89AmeaoRdCJz86VvV/5uiTB2rYK/6Y2o5yHuwoZrNzKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727343737; c=relaxed/relaxed;
	bh=Iz/f4ZHWxcDHUsU3hchNxxVI0CA6JwJ/25nEB88OEYc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DB/uLsPgmWaPBCvXuVMA9ox/KmSv3ySC7JrFljQJF+q69wKUaOn7oYjjvS+5w2HM5kMEQVD5zZJwpvd3oooTDaxo/FhdHdZg+8xgK0JXnlMbwQVf9ikyVB8pgsj7Xn+iZQEfKwmL5QqhMRAUqlhSRnzIWxkHf3EifqO+USPZ0V2EQR/aYzETrvwVf1H7wmcTrS7ILd/hmc7OZt+PDnn7xlhaOnBKH9Lrx1AfMTSkmJA3fWTGkoRUHZkU+TMCl9ZYdtnSibavnisPfx4W9G17AWAcMu7DWxNUlTlLuAg5NK8tkYAJI73WSEC6gK1Bv0BLwiCT8wHbVY7e4UNDk/ZAzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=m5CWey+7; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IHE1jY+h; dkim-atps=neutral; spf=pass (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=m5CWey+7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IHE1jY+h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.157; helo=fhigh-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDpXk3Jvxz2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 19:42:13 +1000 (AEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3DB5811401E9;
	Thu, 26 Sep 2024 05:42:11 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 05:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1727343731;
	 x=1727430131; bh=Iz/f4ZHWxcDHUsU3hchNxxVI0CA6JwJ/25nEB88OEYc=; b=
	m5CWey+73vWL67jCVJR3EmjZDDiNiCw6MO+Ot1XUWYv5UfyjS8s3pN8TAbLQff25
	Sg6lrqUj15QUnRMNC9xx+OWfhvgvgrksQWBj9T71HyGavK79/2CaQa0kUPqTh7DC
	Fvt6VTvqyu15O2wq2P1yNKc9kYs1KYLNWqvusXnHo+loaICAWCuREXIa0dAhwayW
	dzUsDVdiFBIkIpUPDYOS+MBbIfIgIpzznF12mOowuL5GFdjCASs+wKfoomMiWhwN
	5YOjy90Pt4UmI8r1l6CNvouZkNU3ehNp/5NfSx7fSEgs+Nxpdha1xWTGdlfviajT
	usv+4HhF6PYFGOYEoLiD5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343731; x=
	1727430131; bh=Iz/f4ZHWxcDHUsU3hchNxxVI0CA6JwJ/25nEB88OEYc=; b=I
	HE1jY+hK5ssV7obuCeyf3Vdk60sSKieOqkFdb5lrwkWZHYABR3YVlRs6krmSEFhR
	q4sSUNNhZbsHn6M2VmRhDf3Z5+MPJKHd8mkW26jIvRkhlwzFTTY1jlGq2olCFpoK
	aWSBwihRg70fnc1s9rjayXphF2frGbXouJWg09xfG7mEc+Kdy8K1gHZyo+ZSTt5r
	e86m+2uanNC+DEvI+o3C3DXeF84aBM79rZ4i/0Fy/t+h3XW/Hv6bhrdLmj7F1BTU
	oewFEEcmhImsDH8zdXehWqQCIFsGSoo53UAFQiHEJkZykxgQK5fdC4c48kS6PUzp
	LswjblX5lMItVKprSRK1Q==
X-ME-Sender: <xms:cSz1Zhtw1sfZrN0_xZrFwtJRo2ly2-IIkoRYRf9XSecslFFW1Yf4Tw>
    <xme:cSz1ZqcZ4Mn_-B479ffF-LvgWpgZ28YanTE9yczZDJSgIjZuifQSHXPL-CQJDm_Ml
    BRD_QTArWMmc59cnzA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeef
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrg
    drfhhrrghnkhgvnhdruggvpdhrtghpthhtohepvhhlrgguihhmihhrrdhmuhhriihinhes
    rghrmhdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsgh
    hrohhuphdrvghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhr
    tghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpd
    hrtghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehj
    tghmvhgskhgstgesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesgh
    hmrghilhdrtghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:cSz1ZkxOy7rSDphLVTS9LNfuz-xZ0DcXkD6LyC43AmZN667_3xHB2A>
    <xmx:cSz1ZoMK3Ivf8CmyIKLE6hKsYKr-YNbjQG7uuStVPR-pjZccy0tKbQ>
    <xmx:cSz1Zh_wKcXgopX3k4tdeJ6efe46wxmqzIDVda7tQ8Fy8BZtjp_XKA>
    <xmx:cSz1ZoWzEWCkfV0KRcfMRcpDM2Bi9GmS53CNCbQ-fY7gzvdDbHuemw>
    <xmx:cyz1Zi1TkI4jfNUeOagyzusT7o8TNSwRW2Vz9A5SbAkc5TgSR8JAE3m1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 333EE2220071; Thu, 26 Sep 2024 05:42:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Thu, 26 Sep 2024 09:41:48 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Christoph Hellwig" <hch@lst.de>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Damien Le Moal" <dlemoal@kernel.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Greg Ungerer" <gerg@linux-m68k.org>, "Kees Cook" <kees@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matt Turner" <mattst88@gmail.com>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michal Hocko" <mhocko@suse.com>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vladimir Murzin" <vladimir.murzin@arm.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>
Message-Id: <a44eb23a-97cf-4920-8cee-5197754d28f6@app.fastmail.com>
In-Reply-To: <b27eb97b-cb76-4fa8-8b8a-66d3bec655ae@gmx.de>
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-2-arnd@kernel.org>
 <b27eb97b-cb76-4fa8-8b8a-66d3bec655ae@gmx.de>
Subject: Re: [PATCH 1/5] asm-generic: cosmetic updates to uapi/asm/mman.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 26, 2024, at 09:21, Helge Deller wrote:
> On 9/25/24 23:06, Arnd Bergmann wrote:

>> -/* not used by linux, but here to make sure we don't clash with OSF/1 defines */
>> -#define _MAP_HASSEMAPHORE 0x0200
>> -#define _MAP_INHERIT	0x0400
>> -#define _MAP_UNALIGNED	0x0800
>
> I suggest to keep ^^ those. It's useful information which isn't
> easily visible otherwise.

Fair enough. I removed them in order to bring the differences
between files to an absolute minimum, but since at the end
of the series the files only contain the map values, there is
no real harm in keeping them, and they may help.

>> -/* not used by linux, but here to make sure we don't clash with ABI defines */
>> -#define MAP_RENAME	0x020		/* Assign page to file */
>> -#define MAP_AUTOGROW	0x040		/* File may grow by writing */
>> -#define MAP_LOCAL	0x080		/* Copy on fork/sproc */
>> -#define MAP_AUTORSRV	0x100		/* Logical swap reserved on demand */
>
> same here. I think they should be preserved.

Right.

>>   /* 0x01 - 0x03 are defined in linux/mman.h */
>> -#define MAP_TYPE	0x00f		/* Mask for type of mapping */
>> -#define MAP_FIXED	0x010		/* Interpret addr exactly */
>> +#define MAP_TYPE	0x0f		/* Mask for type of mapping */
>> +#define MAP_FIXED	0x10		/* Interpret addr exactly */
>>
>> -/* not used by linux, but here to make sure we don't clash with ABI defines */
>> -#define MAP_RENAME	0x020		/* Assign page to file */
>> -#define MAP_AUTOGROW	0x040		/* File may grow by writing */
>> -#define MAP_LOCAL	0x080		/* Copy on fork/sproc */
>> -#define MAP_AUTORSRV	0x100		/* Logical swap reserved on demand */
>
> If xtensa had those, those should be kept as well IMHO.

The thing with xtensa is that the file was blindly copied from
mips, so I'm sure it never had these, but there may be value
in keeping the two files in sync anyway. The only difference
at the moment is MAP_UNINITIALIZED, which is potentially
used on xtensa-nommu.

Let's see if Max Filippov has an opinion on this, otherwise I'd
keep it the same as mips.

      Arnd

