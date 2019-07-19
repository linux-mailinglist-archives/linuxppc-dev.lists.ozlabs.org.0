Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1740F6D8D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 04:14:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qZLZ2cnqzDqfX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 12:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=altlinux.org
 (client-ip=194.107.17.57; helo=vmicros1.altlinux.org;
 envelope-from=ldv@altlinux.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=altlinux.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 45qZJh22rMzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 12:12:20 +1000 (AEST)
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
 by vmicros1.altlinux.org (Postfix) with ESMTP id 6C8B372CA65;
 Fri, 19 Jul 2019 05:12:18 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
 id 5F3667CC774; Fri, 19 Jul 2019 05:12:18 +0300 (MSK)
Date: Fri, 19 Jul 2019 05:12:18 +0300
From: "Dmitry V. Levin" <ldv@altlinux.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 08/10] open: openat2(2) syscall
Message-ID: <20190719021218.GB18022@altlinux.org>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-9-cyphar@cyphar.com>
 <CAK8P3a33rGhPDFfRBAQyLTMG_WoEgX_toDgWR2O7rSwxKsZG+w@mail.gmail.com>
 <20190718161231.xcno272nvqpln3wj@yavin>
 <CAK8P3a3MiYK4bJiA3G_m5H-TpfN5__--b+=szsJBhG7_it+NQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
In-Reply-To: <CAK8P3a3MiYK4bJiA3G_m5H-TpfN5__--b+=szsJBhG7_it+NQg@mail.gmail.com>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aleksa Sarai <cyphar@cyphar.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, alpha <linux-alpha@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2019 at 11:29:50PM +0200, Arnd Bergmann wrote:
[...]
> 5. you get the same problem with seccomp and strace that
>    clone3() has -- these and others only track the register
>    arguments by default.

Just for the record, this is definitely not the case for strace:
it decodes arrays, structures, netlink messages, and so on by default.


--=20
ldv

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJdMScCAAoJEAVFT+BVnCUIYvwQANcM+eTRdr/OJd9417suNuao
fK6ZbVTB/aaBGBsln3InsvqjxtiOe72mbflNqDDxwP0oUq2xEEAAdYmkEIRJ5pEn
N2R2uSpSqZFIDhR+lm6eAfA28Suec+rb0A9HwKKGHPpd5YrqWaxWEVfRxnCngswi
BH6aC+g9yXIRMR7ge0KVES+Gd5dU1jU8qfQETkko32Ezsnec88dLUftqKIhKWIDd
VnH8ew6RK6aje6oxhHbvqdJnSFXrMeV6Ws//cp2OLF4A4EKOm7q/Rhf0+yFF5ePQ
awYV/U0TdWkjIU9bQDCNDphS5p25MAv3g6AIXaUAotT3gaWe6WpFMSEKMgmBLph1
PsaazyUgw8nOh9RwDFT9yek4gmPF5x0HWrZsI85fKIsOt1t1wX3CHRQ3JVjYkpTC
d4GxWgiiAgTg8b1wjTUAjiMYqVrtSwx9srn6GA6ej9fopN2j4iWkARDLk//+xHWC
UfqMUw42wEY6PNKhY3YCa1M9joeXUlWSbz65v9ZAZRPCoXvo7eNw8EePrwMBX3QM
3pzUI2Ljakux7pASi/YYLl5Vpl1yHqEEi7ToQchsUfTJD/Geqj6528ht9GqBgaYf
s5a/eS/MD0AnBD7ytiDIfimWqrLJrLCpWLEufV60EOzRBFDxoS5QNOhQYbHVsZbh
ZLQTIMZM09jpTHhYqh4r
=2x2F
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
