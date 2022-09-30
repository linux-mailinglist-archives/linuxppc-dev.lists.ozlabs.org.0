Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 487505F092F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 12:35:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf6894CbPz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 20:35:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m+fmX4Gi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf67Y3VLYz3bVt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 20:35:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m+fmX4Gi;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf67R6K1Bz4xGl;
	Fri, 30 Sep 2022 20:35:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664534116;
	bh=SKuit/403TtKi9IVegLO0M0MCgvZAmlsYdK4HyzlPbg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m+fmX4Gi6vnFBD+bSa7+/k6dl0ZvuTo2nv0o6k2AjMidUoiKfc6q4OwDvEFIa3MU4
	 x+PbvqSbZruhCPKxdcb0Q2W2tjfA3u5miqAPfhPP3ze4h52cWAGKSxaB6PdEkYttmk
	 rW7scR02sqk+iyYf1i3Zc8OqV8UqWuffB9qZeIhumZBUzOBnphLm2//xj4X2eNj8Pj
	 St0Zh9zxbwgAwOuQcMPi73lgUXiArUQoRm0TZnhxg+vGufUPNMkMy28o2Ce4SUvv7h
	 Gz5ndgcPzIsyGgP86OghiFlTKhw9os4FyiCPsiiQVSVmbBXso28Wh732od4zIQ+d0+
	 e9FNMJHJouTZQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Nathan Lynch
 <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Pass hw_cpu_id to node
 associativity HCALL
In-Reply-To: <20220930085542.GW28810@kitsune.suse.cz>
References: <55380253ea0c11341824cd4c0fc6bbcfc5752689.camel@linux.ibm.com>
 <87wn9lbzcn.fsf@linux.ibm.com> <20220930085542.GW28810@kitsune.suse.cz>
Date: Fri, 30 Sep 2022 20:35:15 +1000
Message-ID: <87mtahp2u4.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek <msuchanek@suse.de> writes:
> On Thu, Sep 29, 2022 at 05:16:40PM -0500, Nathan Lynch wrote:
>> Haren Myneni <haren@linux.ibm.com> writes:
>> > Generally the hypervisor decides to allocate a window on different
>> > VAS instances. But if the user space wishes to allocate on the
>> > current VAS instance where the process is executing, the kernel has
>> > to pass associativity domain IDs to allocate VAS window HCALL. To
>> > determine the associativity domain IDs for the current CPU, passing
>> > smp_processor_id() to node associativity HCALL which may return
>> > H_P2 (-55) error during DLPAR CPU event.
>> >
>> > This patch fixes this issue by passing hard_smp_processor_id() with
>> > VPHN_FLAG_VCPU flag (PAPR 14.11.6.1 H_HOME_NODE_ASSOCIATIVITY).
>> >
>> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> > ---
>> >  arch/powerpc/platforms/pseries/vas.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platf=
orms/pseries/vas.c
>> > index fe33bdb620d5..533026fd1f40 100644
>> > --- a/arch/powerpc/platforms/pseries/vas.c
>> > +++ b/arch/powerpc/platforms/pseries/vas.c
>> > @@ -348,7 +348,7 @@ static struct vas_window *vas_allocate_window(int =
vas_id, u64 flags,
>> >  		 * So no unpacking needs to be done.
>> >  		 */
>> >  		rc =3D plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
>> > -				  VPHN_FLAG_VCPU, smp_processor_id());
>> > +				  VPHN_FLAG_VCPU, hard_smp_processor_id());
>> >  		if (rc !=3D H_SUCCESS) {
>> >  			pr_err("H_HOME_NODE_ASSOCIATIVITY error: %d\n", rc);
>> >  			goto out;
>>=20
>> Yes, it is always wrong to pass Linux CPU numbers to the hypervisor,
>> which has its own numbering for hardware threads. It usually coincides
>> with Linux's numbering in practice, which tends to hide bugs like this.
>>=20
>> Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> This is the code that introduces the problem, right?
>
> Fixes: b22f2d88e435 ("powerpc/pseries/vas: Integrate API with open/close =
windows")

Yeah, I tagged it when applying. Thanks.

cheers
