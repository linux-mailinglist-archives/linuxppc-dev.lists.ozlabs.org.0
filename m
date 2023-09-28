Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 867D17B105D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 03:30:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwwrl3kfqz3cd0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 11:29:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rww2w1rmNz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 10:53:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rww2s3tzDz4xG0;
	Thu, 28 Sep 2023 10:53:41 +1000 (AEST)
Date: Thu, 28 Sep 2023 10:53:40 +1000
From: Michael Ellerman <michael@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Ariel Miculas <ariel.miculas@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: =?US-ASCII?Q?Re=3A_Fwd=3A_=5BPATCH=5D_powerpc/?= =?US-ASCII?Q?ptrace=3A_Fix_buffer_overflo?= =?US-ASCII?Q?w_when_handling_PTRACE=5FPEEKUSER_and_PTRACE=5FPOKEUSER?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAPDJoNvADrCj8L2RAthXVbBxMNrjbY_4pnHu0QtKKARgyoQ-QA@mail.gmail.com>
References: <CAPDJoNtU9Vuh87PxDkxo+7M_Kg_K4PPNGksPuW_guFbChYu-jA@mail.gmail.com> <20220601155702.176588-1-ariel.miculas@gmail.com> <CAPDJoNvZmeeU+T94rp8BJ0+bH5pDXQCEKPHiQF0Kcu=JrRRfrg@mail.gmail.com> <CAPDJoNsb-HtfOQhD6ntZ8Hqx3fv3WAh1U5Jd3GzyN5EwO8znWA@mail.gmail.com> <CAPDJoNuR8pNa+rp-PG_eeS14EvpMBLAmjNf9JvL=+0QTpwww-w@mail.gmail.com> <d6bd3632-207e-b232-b4a1-0c592a3aaae9@csgroup.eu> <CAPDJoNvADrCj8L2RAthXVbBxMNrjbY_4pnHu0QtKKARgyoQ-QA@mail.gmail.com>
Message-ID: <6C0E6F54-FE56-4A89-8A0B-D954D0BA61A0@ellerman.id.au>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary=----UDE9JG84HY1OBTMDQWZ9F9LSSC501E
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 28 Sep 2023 11:29:35 +1000
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

------UDE9JG84HY1OBTMDQWZ9F9LSSC501E
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Ariel,

I'm sorry about the way I handled your patch=2E I should have spent more t=
ime working with you to develop your patch=2E

I agree that the Reported-by tag doesn't properly reflect the contribution=
 you made, I should have realised that at the time=2E

cheers

(Apologies for the brief reply, I'm on vacation and replying from my phone=
)

On September 28, 2023 1:27:24 AM GMT+10:00, Ariel Miculas <ariel=2Emiculas=
@gmail=2Ecom> wrote:
>I've forwarded this old email thread for visibility and discussion's
>sake around my recent blog post [1][2]
>
>Regards,
>Ariel
>
>[1] https://news=2Eycombinator=2Ecom/item?id=3D37671991
>[2] https://www=2Ereddit=2Ecom/r/programming/comments/16tf5ne/how_i_got_r=
obbed_of_my_first_kernel_contribution/?ref=3Dshare&ref_source=3Dlink

--=20
Sent from my Android phone with K-9 Mail=2E Please excuse my brevity=2E
------UDE9JG84HY1OBTMDQWZ9F9LSSC501E
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div dir=3D"auto">Hi Ariel,<br><br>I'm sorry about=
 the way I handled your patch=2E I should have spent more time working with=
 you to develop your patch=2E<br><br>I agree that the Reported-by tag doesn=
't properly reflect the contribution you made, I should have realised that =
at the time=2E<br><br>cheers<br><br>(Apologies for the brief reply, I'm on =
vacation and replying from my phone)</div><br><br><div class=3D"gmail_quote=
"><div dir=3D"auto">On September 28, 2023 1:27:24 AM GMT+10:00, Ariel Micul=
as &lt;ariel=2Emiculas@gmail=2Ecom&gt; wrote:</div><blockquote class=3D"gma=
il_quote" style=3D"margin: 0pt 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(=
204, 204, 204); padding-left: 1ex;">
<pre class=3D"k9mail"><div dir=3D"auto">I've forwarded this old email thre=
ad for visibility and discussion's<br>sake around my recent blog post [1][2=
]<br><br>Regards,<br>Ariel<br><br>[1] <a href=3D"https://news=2Eycombinator=
=2Ecom/item?id=3D37671991">https://news=2Eycombinator=2Ecom/item?id=3D37671=
991</a><br>[2] <a href=3D"https://www=2Ereddit=2Ecom/r/programming/comments=
/16tf5ne/how_i_got_robbed_of_my_first_kernel_contribution/?ref=3Dshare&amp;=
ref_source=3Dlink">https://www=2Ereddit=2Ecom/r/programming/comments/16tf5n=
e/how_i_got_robbed_of_my_first_kernel_contribution/?ref=3Dshare&amp;ref_sou=
rce=3Dlink</a><br></div></pre></blockquote></div><div dir=3D"auto"><div cla=
ss=3D'k9mail-signature'>-- <br>Sent from my Android phone with K-9 Mail=2E =
Please excuse my brevity=2E</div></div></body></html>
------UDE9JG84HY1OBTMDQWZ9F9LSSC501E--
