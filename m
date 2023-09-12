Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B7479DC83
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 01:12:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=l1RiQBK7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlfWQ4M0Kz3fll
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 09:12:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=l1RiQBK7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 443 seconds by postgrey-1.37 at boromir; Wed, 13 Sep 2023 09:12:02 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlfVV3tJjz3dGr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 09:12:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8Xnsts4Cfn+cOT3sGgRWXdJJo7XuO0f7Sydd31WHTcA=; b=l1RiQBK7aQEeAsxzffD6ydEe/f
	NM+7cytrM7BkaxV8cbnuaUSMNBrvTLl+1kI6ycPclYye8dQeFhv6BYOZ5d5lDyTkq7p8yRsWccYMq
	nOLM5MDkKFXrsC52KEyCubDJflkn4N4KzOpbwIvg1CK8cVHV2xeX2HXhLWZbjB7Jgqvkw5IfPB2/4
	jnlEVaw8jyP5ATaifqb6WdAKZa8ftjMdlEbrSPwalEPFEKYIdhoeGJZwtWyqW/TQR/kxWH4hdDs5j
	5PRd3ZFf+lSo0hiVCswIub4eXPhFv0buNl6FdPSAq3eSvp599F4IZ2+mb2sAbrNukx9zu++JWJt+3
	FmxzjG+w==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33570)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qgCQF-0001kz-0s;
	Wed, 13 Sep 2023 00:03:56 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qgCQ9-000384-3j; Wed, 13 Sep 2023 00:03:49 +0100
Date: Wed, 13 Sep 2023 00:03:49 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with
 B/H/W
Message-ID: <ZQDuVTSycDcjDkvi@shell.armlinux.org.uk>
References: <20230912224654.6556-1-puranjay12@gmail.com>
 <20230912224654.6556-6-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912224654.6556-6-puranjay12@gmail.com>
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
Cc: Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>, Shubham Bansal <illusionist.neo@gmail.com>, linux-riscv@lists.infradead.org, Daniel Borkmann <daniel@iogearbox.net>, Helge Deller <deller@gmx.de>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Xi Wang <xi.wang@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Luke Nelson <luke.r.nels@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Wang YanQing <udknight@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
 , Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 12, 2023 at 10:46:53PM +0000, Puranjay Mohan wrote:
> The JITs should not depend on the verifier for zero extending the upper
> 32 bits of the destination register when loading a byte, half-word, or
> word.
> 
> A following patch will make the verifier stop patching zext instructions
> after LDX.

This was introduced by:

163541e6ba34 ("arm: bpf: eliminate zero extension code-gen")

along with an additional function. So three points:

1) the commit should probably explain why it has now become undesirable
to access this verifier state, whereas it appears it was explicitly
added to permit this optimisation.
2) you state that jits should not depend on this state, but the above
commit adds more references than you're removing, so aren't there still
references to the verifier remaining after this patch? I count a total
of 10, and the patch below removes three.
3) what about the bpf_jit_needs_zext() function that was added to
support the export of this zext state?

Essentially, the logic stated in the commit message doesn't seem to be
reflected by the proposed code change.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
