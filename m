Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D196D8BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 04:07:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qZCZ0j2XzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 12:07:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=altlinux.org
 (client-ip=194.107.17.57; helo=vmicros1.altlinux.org;
 envelope-from=ldv@altlinux.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=altlinux.org
X-Greylist: delayed 402 seconds by postgrey-1.36 at bilbo;
 Fri, 19 Jul 2019 12:06:22 AEST
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 45qZ9p3pMZzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 12:06:22 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 492A272CA65;
 Fri, 19 Jul 2019 04:59:34 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 3B39E7CC774; Fri, 19 Jul 2019 04:59:34 +0300 (MSK)
Date: Fri, 19 Jul 2019 04:59:34 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v9 08/10] open: openat2(2) syscall
Message-ID: <20190719015933.GA18022@altlinux.org>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-9-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="huq684BweRXVnRxX"
Content-Disposition: inline
In-Reply-To: <20190706145737.5299-9-cyphar@cyphar.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--huq684BweRXVnRxX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 07, 2019 at 12:57:35AM +1000, Aleksa Sarai wrote:
[...]
> +/**
> + * Arguments for how openat2(2) should open the target path. If @extra i=
s zero,
> + * then openat2(2) is identical to openat(2).
> + *
> + * @flags: O_* flags (unknown flags ignored).

What was the rationale for implementing this semantics?
Ignoring unknown flags makes potential extension of this new interface
problematic.  This has bitten us many times already, so ...

> + * @mode: O_CREAT file mode (ignored otherwise).
> + * @upgrade_mask: restrict how the O_PATH may be re-opened (ignored othe=
rwise).
> + * @resolve: RESOLVE_* flags (-EINVAL on unknown flags).

=2E.. could you consider implementing this (-EINVAL on unknown flags) seman=
tics
for @flags as well, please?


--=20
ldv

--huq684BweRXVnRxX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJdMSQFAAoJEAVFT+BVnCUIuaAP/3pgUoQA466F6S8jYN6F/icf
oiQHExdeO3ruxRdNl1gi7af0RxQCiprfNIoD7KQyWSnyUyUm0Cdd7PzpEKXuumQi
pN6ZTEO2bQeSs7AjCNpLrTgKcuOo/pZbNN7InAHKLB7k2xKKeBbdaVypgGiAEDjT
JK+4s+8JcJoSg+d69G428QP2qpoHyIZJ5437gYv5rJbL9BRihwwvWF2OQ4TXrd6I
YnyxPFRRZnfiN3HNbNlJjtMgt5g0AisLuahpJaDMq0NaXnBOosDm9jBAhVOX0CSB
LUNByCygXeBKv9VuyrO4KnLXS3ORGfK38SDGqz3kFYy1quNRAGKgOXPnGXfb2xbZ
bRCqyuxkSUOIfLKA6q9jnqO9RoUeOtLglFUT/5JpixTaoxSFN3Y6GlJFcnw+cVm+
oWH4A/IoST68FCfbOMff976O36pakuWbsVGVsdv384OEHfWaf7c10P9EQc3fhgF3
JoeY5ht9R1k8HWNOlCuCeHfTwSyLG3T/TROuZYtz65RdPemuuPSPERr+GzOtO9Fn
+wQmK99JlE3nhoyv5CmtqCmMQWhYZedqjbjs5wIq7tjalerg6TakNMmhzTGz5l8T
i+3EfyMHhEtwq+2YNhdaPEmjfdBzyI3stxtEkURya0BnCgbYsP2mTIP8UbLGDqsY
EJZiRtPRFfVoePwqT8Ux
=zLLc
-----END PGP SIGNATURE-----

--huq684BweRXVnRxX--
