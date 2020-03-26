Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E270A1934FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 01:30:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nm8r1BTPzDqSh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 11:30:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nm7D3q6RzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 11:28:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZFkemkfS; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48nm7C3TQDz9sSH; Thu, 26 Mar 2020 11:28:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48nm7B61Gqz9sP7;
 Thu, 26 Mar 2020 11:28:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585182519;
 bh=HvhyHuEisauW5HPDBrkU6fmSK0lp8cwE3e85SGrEQko=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=ZFkemkfSR4fPfnGOeMRfTaWiF8Imkvs8GMopD1cqyEj+Il6TXporKrs8IJ9l4sKXj
 H2Gq/u7XV46mCAxu+2cvI3sCGd5Utc+Sg8o6hsvSu7ZK3YtDYZhoFmknhKwbw5B3Ow
 F6MX3aSUf5Y2wMddjdLbW0brtSAh58hK5vBywn3XEafM8cjvhaB3wogZHn76f1yWEQ
 1UUcSnhbQ6lclHSEDChqnufSYpQhZ0FiVnL9HUXCPNnjD8SQQ6gX4LJPx5Zf3tG9Bp
 NeXh6OvmA1xEaOyYOK913HFE35QXWJHaVw6sozmNld6teHefUT3r3EUVpc9ym7vZFi
 FESqQUJTFUfoA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "christophe.leroy\@c-s.fr" <christophe.leroy@c-s.fr>,
 "linuxppc-dev\@ozlabs.org" <linuxppc-dev@ozlabs.org>
Subject: Re: hardcoded SIGSEGV in __die() ?
In-Reply-To: <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
References: <73da05c0f54692a36471a2539dbd9b30594b687a.camel@infinera.com>
 <b20d978b-268b-773a-a43e-7ff4c741f2df@c-s.fr>
 <c14de482-6784-f1ac-f675-d771e55ac688@c-s.fr>
 <4f4f2c97f7393f21f507c58def88514c9f670e0a.camel@infinera.com>
Date: Thu, 26 Mar 2020 11:28:42 +1100
Message-ID: <87lfnovu11.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joakim Tjernlund <Joakim.Tjernlund@infinera.com> writes:
> On Mon, 2020-03-23 at 15:45 +0100, Christophe Leroy wrote:
>> Le 23/03/2020 =C3=A0 15:43, Christophe Leroy a =C3=A9crit :
>> > Le 23/03/2020 =C3=A0 15:17, Joakim Tjernlund a =C3=A9crit :
>> > > In __die(), see below, there is this call to notify_send() with
>> > > SIGSEGV hardcoded, this seems odd
>> > > to me as the variable "err" holds the true signal(in my case SIGBUS)
>> > > Should not SIGSEGV be replaced with the true signal no.?
>> >=20
>> > As far as I can see, comes from
>> > https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
t.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fco=
mmit%2F%3Fid%3D66fcb1059&amp;data=3D02%7C01%7CJoakim.Tjernlund%40infinera.c=
om%7C4291ac1b501e4296869a08d7cf38cdb4%7C285643de5f5b4b03a1530ae2dc8aaf77%7C=
1%7C0%7C637205715189366995&amp;sdata=3DZ2bFsmDlD2MKhLACQvayk9ejz0dqgMEOlBTl=
ocAmtTg%3D&amp;reserved=3D0
>> >=20
>>=20
>> And
>> https://nam03.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.=
kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcomm=
it%2F%3Fid%3Dae87221d3ce49d9de1e43756da834fd0bf05a2ad&amp;data=3D02%7C01%7C=
Joakim.Tjernlund%40infinera.com%7C4291ac1b501e4296869a08d7cf38cdb4%7C285643=
de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C637205715189366995&amp;sdata=3D97kyz3U=
r88BhDUUYzya5t%2FFQVhXYu6qiHoW8hsEg81s%3D&amp;reserved=3D0
>> shows it is (was?) similar on x86.
>>=20
>
> I tried to follow that chain thinking it would end up sending a signal to=
 user space but I cannot see
> that happens. Seems to be related to debugging.
>
> In short, I cannot see any signal being delivered to user space. If so th=
at would explain why
> our user space process never dies.
> Is there a signal hidden in machine_check handler for SIGBUS I cannot see?

It's platform specific. What platform are you on?

See the ppc_md & cur_cpu_spec calls here:

void machine_check_exception(struct pt_regs *regs)
{
	int recover =3D 0;
	bool nested =3D in_nmi();
	if (!nested)
		nmi_enter();

	__this_cpu_inc(irq_stat.mce_exceptions);

	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_NOW_UNRELIABLE);

	/* See if any machine dependent calls. In theory, we would want
	 * to call the CPU first, and call the ppc_md. one if the CPU
	 * one returns a positive number. However there is existing code
	 * that assumes the board gets a first chance, so let's keep it
	 * that way for now and fix things later. --BenH.
	 */
	if (ppc_md.machine_check_exception)
		recover =3D ppc_md.machine_check_exception(regs);
	else if (cur_cpu_spec->machine_check)
		recover =3D cur_cpu_spec->machine_check(regs);

	if (recover > 0)
		goto bail;


Either the ppc_md or cpu_spec handlers can send a signal, but after a
bit of grepping I think only the pseries and powernv ones do.

If you get into die() then it's an oops, which is not the same as a
normal signal.

cheers
