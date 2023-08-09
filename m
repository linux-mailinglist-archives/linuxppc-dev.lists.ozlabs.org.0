Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7C7761CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 15:55:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=tXn5xruI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B8Y1wPkI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLWlg6L5Hz3fYH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Aug 2023 23:55:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=tXn5xruI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B8Y1wPkI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLWL931SDz3dC6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Aug 2023 23:36:32 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 9124B5C0135;
	Wed,  9 Aug 2023 09:36:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 09 Aug 2023 09:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691588187; x=1691674587; bh=3msJaR5UXBLEoKC1HXIH2RtyP/pUMBgvaBb
	jwAf59DQ=; b=tXn5xruIL2ZWBIL+b/oduuBk+e8qnkdtDb4USof3cljLWqAcPfQ
	ML0TZbP9FLtBiOlaBdEruMwN7SRE/ot5fj7w9Eer0HyDE4QFAFyaruLNRsr1B2RQ
	cUqAYz7MNIVy1VTacX82SyQ97DVW4ELs/yT3+ttAyF0499IIBEPO+LGxWSGMz9my
	BV8Ec/wqBuED3TkSLK/5Fp2K8SnI5VktbbDtI74Ey654us5o4wh5OkeLEdMy/YjN
	7fTniGBLzqSpHhUKhuuHv5iGRfLlgH0f8dCPMsVH1D9rz1HNUbpf7wnGM/O/Xd3Y
	IsRDYRUa817ub1msfWZOxnyJZgIBfoJoAIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1691588187; x=1691674587; bh=3msJaR5UXBLEoKC1HXIH2RtyP/pUMBgvaBb
	jwAf59DQ=; b=B8Y1wPkIrwz9wCwtgZC8ks1X8dcR//B5L4dPMtbSxacmki1+5lt
	FkMUZzIu6i3zuXuwdIWMtpVgx/P70TvCY14lr0Zw8DU28p95F+a/YaJ8j3NY4yQR
	dYZQYre++R7JTvXb3k8oRM48cAm7GbsDLMjXnlK8Uz7Reo0skA5hwgfFqMYXQqXv
	SjX1qmwGyxNzNMUgqQxTyVXyp17jZomWD1iQYgxSwN+EyheEZuDqEP317MagtXi2
	N/dm+HTu23ZDECKdTomeRHLfIUczfdd1/Yix+3eI1wk2KkUtvVpvkLVqngcfX6J4
	2C06ot7BCz+wv+XuHVWW6dXJFJ+/QCmlyLw==
X-ME-Sender: <xms:WpbTZI0awJeeoOruYStqDGtlN_LmZS2tF2CNPt7ilqTqSbKD69YmEQ>
    <xme:WpbTZDEYmDwKIZazTpgljzGu13IDpMnigC10j2lyIGAzBbMj_JDNftqJC6vznNKuM
    k3LSb2vHUXL7KBiVjo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleeggdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeufeef
    ieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:WpbTZA6rCjUKLUrF3LKbyYBXe5n7r9r_5MjP1bJlF_TjKgPB7NoAvw>
    <xmx:WpbTZB3VBEXRyvYO_e6G5ahCiezY03ALoFGGZhNFGjwOBHSDTUgSrA>
    <xmx:WpbTZLGPhpOm2VF8YWbftR8orvd7vnFngaCnEHpk1LVUbnoDCjnBXQ>
    <xmx:W5bTZCB3HR6xM4_HZ_UKOpJgqKz-xs4lDwe7QhNCsYmmS-FaChmKnQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CD8E1B60089; Wed,  9 Aug 2023 09:36:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <eeeef65a-fbf9-403f-8541-5169b06976d7@app.fastmail.com>
In-Reply-To: <66ca8677-6a8d-c2f6-f215-a49ae7248458@csgroup.eu>
References: <20230809131024.2039647-1-arnd@kernel.org>
 <66ca8677-6a8d-c2f6-f215-a49ae7248458@csgroup.eu>
Date: Wed, 09 Aug 2023 15:35:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: mark more local variables as volatile
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Hugh Dickins <hughd@google.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maninder Singh <maninder1.s@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 9, 2023, at 15:17, Christophe Leroy wrote:
> Le 09/08/2023 =C3=A0 15:10, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> A while ago I created a2305e3de8193 ("powerpc: mark local variables
>> around longjmp as volatile") in order to allow building powerpc with
>> -Wextra enabled on gcc-11.
>
> Should this be explained in=20
> https://docs.kernel.org/process/volatile-considered-harmful.html ?
>

My feeling is that these two files are special enough that we
don't have to worry about it in general, there is only one other
caller of setjmp in the kernel, and the setjmp() man page
explicitly mentions this problem and the workaround.

     Arnd
