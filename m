Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0DA662487
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 12:46:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrBxM2GXZz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:46:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=arndb.de header.i=@arndb.de header.a=rsa-sha1 header.s=fm2 header.b=ZHqOJfVE;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm3 header.b=VtI2mFwa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ZHqOJfVE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VtI2mFwa;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nr6vk1wH6z2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 19:45:05 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 7FD36581AA7;
	Mon,  9 Jan 2023 03:45:01 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 09 Jan 2023 03:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1673253901; x=1673261101; bh=L1F91mJJga
	KEg4dA8VxYJyoEo2s3t1TaV8Gb51DrVJU=; b=ZHqOJfVE4c6xFw3/p0qjzlvgc8
	sZK8ubua9tRvd8AL1pgBOC+W54+i0s103/Uo2Nd4vMqCwub/cFWh9pa86ExQnKvC
	H0ICds25qX1dR/pC1oMKTdqginc50Cx8VWEYNGVeMNN64o6BEraXOT5/hS1d9/1o
	+HSTxq1kzKGnbqT94yDsCsyf/1YNyb2uCSPdflrvU/XEZ7AyHCavaxaRCVI5NzPG
	UpiBxJIKA9nE+et/xz1ZcLSmRRj6ultRn+N/nUlo35Ab3oeRL2qxtSBEuOGxjioL
	1DBHiuFmnpRfjCuWtAmZuZKqnu/KYlE2V2qPM+urprV0i++KGNxiRKxvNhkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1673253901; x=1673261101; bh=L1F91mJJgaKEg4dA8VxYJyoEo2s3
	t1TaV8Gb51DrVJU=; b=VtI2mFwa1wdlfMPsXoEjwoJuNEW/mxiKPgcETCHcUlZu
	zf/t/cMBcKhmu2HAXuvDxaXT2/15rFV6C0MDfLWAIctS2e83ijQ7KbUzz9EpVJ9t
	a8eHCAD61N8ilW//dtJs5oS/v99ti8mU109RAPwJWM66cZ7D1YiZpGWnjS0R4tRK
	i3isGPeyvCRjIm7K/pJ1+lOkxgMNG01CAcjMAuLrZODkDrAy7CVHhf3aU+mD0EEY
	0pZpFPV9zrZXYKFx+YOnjgwouZrP0UUeAPG+n5E3eCBYCWruDVTcJ0vxcav6rxMg
	rQF4Wai+GRwUzNdekF3Nm250Wf+sPiivUaFP2E5lWA==
X-ME-Sender: <xms:C9S7Y0S2xmZhH6s9u9ITXYUE1le0_HE3UGTeXf2IPKCtJ_E-cFPu9g>
    <xme:C9S7YxzPApG-ZhUY0SvRoazo89RJcQ3pf6J3wyIn8YbRyjVO7yV2CRUdN-b4qJ7ji
    KaWi2UzIgKLBbfKw6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeehgdduvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:C9S7Yx2vdXEsSiA1YVueXaf1rShBxKvVsfyoj6JQIQONUyHEFs3RnA>
    <xmx:C9S7Y4AJD-R-FC04EXizeq0rmJNwEimVrK-BNEZE_I3Y4YIRrp3OJg>
    <xmx:C9S7Y9jPM5uqmaAsJH_o0bDqIbhqoZcrw1n_0f_W0sDtFD_cLozjbw>
    <xmx:DdS7Y-L4bGrucj7lylZ9QWkc28mrbeycIf9zuKDTInYyHmeryhS4mA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E992AB60086; Mon,  9 Jan 2023 03:44:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <c44bd7e8-68ff-44f8-b50b-4d27b4fe29dc@app.fastmail.com>
In-Reply-To: <ad6efc07-1706-a8e2-1478-45124838a043@kernel.org>
References: <20220818004357.375695-1-stephen@networkplumber.org>
 <07786498-2209-3af0-8d68-c34427049947@kernel.org>
 <po9s7-9snp-9so3-n6r5-qs217ss1633o@vanv.qr>
 <ad6efc07-1706-a8e2-1478-45124838a043@kernel.org>
Date: Mon, 09 Jan 2023 09:44:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jiri Slaby" <jirislaby@kernel.org>, "Jan Engelhardt" <jengelh@inai.de>
Subject: Re: [PATCH net-next] Remove DECnet support from kernel
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 09 Jan 2023 22:45:00 +1100
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jeff Layton <jlayton@kernel.org>, Nikolay Aleksandrov <razor@blackwall.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Nathan Fontenot <nathan.fontenot@amd.com>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Neeraj Upadhyay <quic_neeraju@quicinc.com>, Menglong Dong <imagedong@tencent.com>, Florian Fainelli <f.fainelli@gmail.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pabl
 o Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Petr Machata <petrm@nvidia.com>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Yu Zhe <yuzhe@nfschina.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, "Martin K. Petersen" <martin.petersen@oracle.com>, Netdev <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <linux-kernel@vger.kernel.org>, Stephen Hemminger
  <stephen@networkplumber.org>, Chuck Lever <chuck.lever@oracle.com>, "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, Antoine Tenart <atenart@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 9, 2023, at 09:34, Jiri Slaby wrote:
> On 09. 01. 23, 9:14, Jan Engelhardt wrote:
>> On Monday 2023-01-09 08:04, Jiri Slaby wrote:
>
> Right, we used to keep providing also defines and structs in uapi 
> headers of removed functionality. So that the above socket would 
> compile, but fail during runtime.
>
> I am not biased to any solution. In fact, I found out trinity was fixed 
> already. So either path networking takes, it's fine by me. I'm not sure 
> about the chromium users, though (and I don't care).

Chromium and some of the others look like automatically generated
lists of files and the rest seem to have compile-time checks.

From a brief look at all the packages in the debian codesearch
link you provided, I don't see any that are likely to cause
problems aside from trinity.

    Arnd
