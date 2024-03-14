Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3073A87C541
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 23:41:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=freebsd.org header.i=@freebsd.org header.a=rsa-sha256 header.s=dkim header.b=A51Ptusn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Twj6l6m2hz3vhp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 09:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=freebsd.org header.i=@freebsd.org header.a=rsa-sha256 header.s=dkim header.b=A51Ptusn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=freebsd.org (client-ip=96.47.72.81; helo=mx2.freebsd.org; envelope-from=jhb@freebsd.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 1165 seconds by postgrey-1.37 at boromir; Fri, 15 Mar 2024 04:05:30 AEDT
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwYff4vD6z30f5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 04:05:29 +1100 (AEDT)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
	by mx2.freebsd.org (Postfix) with ESMTPS id 4TwYfZ2dfkz41HY;
	Thu, 14 Mar 2024 17:05:26 +0000 (UTC)
	(envelope-from jhb@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [IPv6:2610:1c1:1:606c::24b:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
	by mx1.freebsd.org (Postfix) with ESMTPS id 4TwYfZ1j4gz49x0;
	Thu, 14 Mar 2024 17:05:26 +0000 (UTC)
	(envelope-from jhb@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
	t=1710435926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9j0M8JjxyKdPr3iVbt4uZU0hUBO6Bi0AlJBh7AZ66ww=;
	b=A51PtusnP8asP8mnDHEarH6Ygs7ApTBboH+2fkmMUZZWMQd6O2ZnfnsaAeM8sabDEqzkRz
	08bgNG2faS/SlNd+34rb2StDL/E4oUpsYVrp6oXecdQ0/OYpQuzjus+pS+TQOeM0ng0tp7
	QHMsNl8RFwMn5FGJB67uGfsa0d+LpJ/eycek8xJH5HmFKOTHJoMd62ecdomzVEwcWY7bmK
	p0brbvdkTeniKPoV/EjTlAJiwPO5BGqGAlfqV52jdnd0eoxx8Yur9qaHX+rlcQSn76NJ2R
	MfamkDe2dJS7AjEVgYh560gB65doD8KEU0iSd7STNxGd8hRm+qABTqZjkyYvzg==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1710435926; a=rsa-sha256; cv=none;
	b=vm7k1fiPbWJRiqvXvm7Ez8E4FTzKcB6GfoF7flPBilfr1wfM2/Ld+gpgSkWKjj2Mi3aZ3T
	ydoR2k0dpzwRFhgsdFLo9skNsAJ2Kih9sVr1RZlitKN3Ohgn8ukmZO1xgkET5Ngi7yNJjM
	z3s9nC5zBIZ3Y4r072FqqL415nfL8ZmaXUgiUQOqhEyDp4c6Rx9G6iImsohDZJb4JQPer1
	T8b258H0cmME0PYhrmb0LYRn0yci2wNvlH3hulkrA7C3c24UWOre/J1BMetsV2DsD/Tb1x
	BNzR9R9/BYzyiWnueGwKXmGuxwe7HUWqGfTLq65SXVPsxCYPMaRhFs2U7pfJyA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
	s=dkim; t=1710435926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9j0M8JjxyKdPr3iVbt4uZU0hUBO6Bi0AlJBh7AZ66ww=;
	b=JFPLHqMDzcZhkDiXx3+G2enS6uq9qihacbeSHGKIV38irhdfze26RrdTDocRqr8zue12EY
	N6+A8Ff1UBf6S94UeegAQu2uLdml9S4HeXYhhsRYG3kO61rFByJNxoZ6AbqdsN+VB3JARj
	vaJLd1EJm2AVZ32/AB9zvK7jFTW0u6LkUd/ICBFJ7H+BsHbJF1uZQBcf9TwnS2PllWVhlS
	gqLehBMi5XHoo4LIpKvRr4Smq50V2rZ8wYYrVoyl+/u1IqK1ngVqtkey6K5Fa44nobLMy3
	me7kgcdz6lWhIMKR4qf3GX2tDCBDV4h5ISeMKj7Krt5ameP8vWRAio9DNA4wtg==
Received: from [128.232.109.22] (user-109-22.vpn.cl.cam.ac.uk [128.232.109.22])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: jhb)
	by smtp.freebsd.org (Postfix) with ESMTPSA id 4TwYfT3WVWzNvT;
	Thu, 14 Mar 2024 17:05:21 +0000 (UTC)
	(envelope-from jhb@FreeBSD.org)
Message-ID: <fb50847a-37a4-494f-a5c4-a2087ff35a78@FreeBSD.org>
Date: Thu, 14 Mar 2024 10:05:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] x86/elf: Add a new .note section containing Xfeatures
 information to x86 core files
Content-Language: en-US
To: Dave Hansen <dave.hansen@intel.com>,
 Vignesh Balasubramanian <vigbalas@amd.com>, linux-kernel@vger.kernel.org,
 linux-toolchains@vger.kernel.org
References: <20240314112359.50713-1-vigbalas@amd.com>
 <20240314112359.50713-2-vigbalas@amd.com>
 <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
From: John Baldwin <jhb@FreeBSD.org>
In-Reply-To: <dd54d6de-0bcc-4b2e-a420-b1a429b06246@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 15 Mar 2024 09:37:24 +1100
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
Cc: matz@suse.de, keescook@chromium.org, felix.willgerodt@intel.com, bpetkov@amd.com, x86@kernel.org, npiggin@gmail.com, aneesh.kumar@kernel.org, linux-mm@kvack.org, ebiederm@xmission.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, binutils@sourceware.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/24 8:37 AM, Dave Hansen wrote:
> On 3/14/24 04:23, Vignesh Balasubramanian wrote:
>> But this patch series depends on heuristics based on the total XSAVE
>> register set size and the XCR0 mask to infer the layouts of the
>> various register blocks for core dumps, and hence, is not a foolproof
>> mechanism to determine the layout of the XSAVE area.
> 
> It may not be theoretically foolproof.  But I'm struggling to think of a
> case where it would matter in practice.  Is there any CPU from any
> vendor where this is actually _needed_?
> 
> Sure, it's ugly as hell, but these notes aren't going to be available
> universally _ever_, so it's not like the crummy heuristic code gets to
> go away.

I forgot to mention one other use case for this note.

Today (and before my earlier patch series to add the ugly heuristic),
when the NT_X86_XSTATE core dump note grows because a CPU vendor adds
a new xfeature and OS's which just dump the entire XSAVE state start
including that, GDB fails to parse the entire note.

Having a note describing the layout (whichever format is chosen),
allows GDB to still pull registers for features it understands from
the larger note and ignoring the parts of the XSAVE block it doesn't
understand.

-- 
John Baldwin

