Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6533B6EB821
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Apr 2023 11:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q3QNT06sXz3f52
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Apr 2023 19:00:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bdXprAp0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::22; helo=out-34.mta0.migadu.com; envelope-from=konstantin.ryabitsev@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bdXprAp0;
	dkim-atps=neutral
X-Greylist: delayed 350 seconds by postgrey-1.36 at boromir; Sat, 22 Apr 2023 05:16:24 AEST
Received: from out-34.mta0.migadu.com (out-34.mta0.migadu.com [IPv6:2001:41d0:1004:224b::22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q34540cxcz3cj1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Apr 2023 05:16:23 +1000 (AEST)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1682104214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9nptc7nFsnBkPk8XtEJlycB0Q788aB2D6UaBkyu74Y=;
	b=bdXprAp0tYcirhanYw8bQqri9ckfvXGij3zsRaW31Rp79TyHytNiP2LAxDLzMsdR5D3k2s
	/sAQyoNd2ertNgOwtYKlhN53Xmy7kKlJU8m3Bp2V1JtejQ3beDelYG2pLP9Oxelww9x+Id
	ipSUd4q1YPaHNRcS7BdzJqpbW97DvI0=
Date: Fri, 21 Apr 2023 19:10:14 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Konstantin Ryabitsev" <konstantin.ryabitsev@linux.dev>
Message-ID: <ba235aa677a561ceb2dc776414403dc0@linux.dev>
Subject: Re: [PATCH v9 0/6] Introduce 64b relocatable kernel
To: "Palmer Dabbelt" <palmer@dabbelt.com>, alexghiti@rivosinc.com
In-Reply-To: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
References: <mhng-bb70f74f-2b5b-4880-b7bf-975e67dc554e@palmer-ri-x1c9>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Sat, 22 Apr 2023 19:00:11 +1000
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
Cc: aou@eecs.berkeley.edu, linux-kbuild@vger.kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, bjorn@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

April 21, 2023 2:59 PM, "Palmer Dabbelt" <palmer@dabbelt.com> wrote:=0A>>=
 riscv: Use PUD/P4D/PGD pages for the linear mapping=0A>> (https://patchw=
ork.kernel.org/project/linux-riscv/list/?series=3D733603)=0A>> base-commi=
t-tag: v6.3-rc1=0A> =0A> The QEMU CI has some way to say "this depends on=
 an un-merged patch set sent as $MESSAGE_ID", not=0A> sure if that's a b4=
-ism but it's a bit less confusing.=0A=0AI think it's patchwork-ism, actu=
ally. B4 will eventually learn to be able to include dependent series inf=
o and automatically retrieve/apply them in the proper order on "shazam", =
but it can't do that yet.=0A=0A-K
