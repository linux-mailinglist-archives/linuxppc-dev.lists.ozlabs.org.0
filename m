Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB5BABD34
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 18:01:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Q2Ny0yQhzDr39
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Sep 2019 02:01:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=deller@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.b="Soj1s8U2"; 
 dkim-atps=neutral
X-Greylist: delayed 327 seconds by postgrey-1.36 at bilbo;
 Sat, 07 Sep 2019 01:59:32 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Q2LX1gpwzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2019 01:59:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1567785567;
 bh=ILLsMovo2wzJhsqraHW1dS8hVbQROMHnCcy19D9vULw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=Soj1s8U2rST1zkj7O5yIjwdpj7fBFAJ7nBh7vrKJxY65mSH697KeIr59ZusA/i98t
 6ba7J/pCL4UI8NHhxruC4y6QzyW+39/kGylmRAzfwp8QTWePztTZ/DfBirIrjbDsbP
 EAqegiuhOSN6Lyf1p9gFCjaVrqdbiFMOPc1KYHrE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.135.139]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0LgvEY-1iSjgG2Fy2-00oBcR; Fri, 06
 Sep 2019 17:53:42 +0200
Subject: Re: [PATCH v5 0/7] kexec: add generic support for elf kernel images
To: Sven Schnelle <svens@stackframe.org>, kexec@lists.infradead.org
References: <20190823194919.30916-1-svens@stackframe.org>
From: Helge Deller <deller@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=deller@gmx.de; keydata=
 xsBNBFDPIPYBCAC6PdtagIE06GASPWQJtfXiIzvpBaaNbAGgmd3Iv7x+3g039EV7/zJ1do/a
 y9jNEDn29j0/jyd0A9zMzWEmNO4JRwkMd5Z0h6APvlm2D8XhI94r/8stwroXOQ8yBpBcP0yX
 +sqRm2UXgoYWL0KEGbL4XwzpDCCapt+kmarND12oFj30M1xhTjuFe0hkhyNHkLe8g6MC0xNg
 KW3x7B74Rk829TTAtj03KP7oA+dqsp5hPlt/hZO0Lr0kSAxf3kxtaNA7+Z0LLiBqZ1nUerBh
 OdiCasCF82vQ4/y8rUaKotXqdhGwD76YZry9AQ9p6ccqKaYEzWis078Wsj7p0UtHoYDbABEB
 AAHNHEhlbGdlIERlbGxlciA8ZGVsbGVyQGdteC5kZT7CwJIEEwECADwCGwMGCwkIBwMCBhUI
 AgkKCwQWAgMBAh4BAheAFiEE9M/0wAvkPPtRU6Boh8nBUbUeOGQFAlrHzIICGQEACgkQh8nB
 UbUeOGT1GAgAt+EeoHB4DbAx+pZoGbBYp6ZY8L6211n8fSi7wiwgM5VppucJ+C+wILoPkqiU
 +ZHKlcWRbttER2oBUvKOt0+yDfAGcoZwHS0P+iO3HtxR81h3bosOCwek+TofDXl+TH/WSQJa
 iaitof6iiPZLygzUmmW+aLSSeIAHBunpBetRpFiep1e5zujCglKagsW78Pq0DnzbWugGe26A
 288JcK2W939bT1lZc22D9NhXXRHfX2QdDdrCQY7UsI6g/dAm1d2ldeFlGleqPMdaaQMcv5+E
 vDOur20qjTlenjnR/TFm9tA1zV+K7ePh+JfwKc6BSbELK4EHv8J8WQJjfTphakYLVM7ATQRQ
 zyD2AQgA2SJJapaLvCKdz83MHiTMbyk8yj2AHsuuXdmB30LzEQXjT3JEqj1mpvcEjXrX1B3h
 +0nLUHPI2Q4XWRazrzsseNMGYqfVIhLsK6zT3URPkEAp7R1JxoSiLoh4qOBdJH6AJHex4CWu
 UaSXX5HLqxKl1sq1tO8rq2+hFxY63zbWINvgT0FUEME27Uik9A5t8l9/dmF0CdxKdmrOvGMw
 T770cTt76xUryzM3fAyjtOEVEglkFtVQNM/BN/dnq4jDE5fikLLs8eaJwsWG9k9wQUMtmLpL
 gRXeFPRRK+IT48xuG8rK0g2NOD8aW5ThTkF4apznZe74M7OWr/VbuZbYW443QQARAQABwsBf
 BBgBAgAJBQJQzyD2AhsMAAoJEIfJwVG1HjhkNTgH/idWz2WjLE8DvTi7LvfybzvnXyx6rWUs
 91tXUdCzLuOtjqWVsqBtSaZynfhAjlbqRlrFZQ8i8jRyJY1IwqgvHP6PO9s+rIxKlfFQtqhl
 kR1KUdhNGtiI90sTpi4aeXVsOyG3572KV3dKeFe47ALU6xE5ZL5U2LGhgQkbjr44I3EhPWc/
 lJ/MgLOPkfIUgjRXt0ZcZEN6pAMPU95+u1N52hmqAOQZvyoyUOJFH1siBMAFRbhgWyv+YE2Y
 ZkAyVDL2WxAedQgD/YCCJ+16yXlGYGNAKlvp07SimS6vBEIXk/3h5Vq4Hwgg0Z8+FRGtYZyD
 KrhlU0uMP9QTB5WAUvxvGy8=
Message-ID: <22b40bb7-6f86-0a69-12b2-12d90124173d@gmx.de>
Date: Fri, 6 Sep 2019 17:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190823194919.30916-1-svens@stackframe.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OZFtsKsC3ERF/tV2tKZQoDZfmR2AcWcPql0X1C/476klrmVLhyw
 WYFwxu6nAbzW3JrUFMveWfNTgXFOTGoay/4On4757N11NkhfKpQMtk6HrJXRXvIQX9A5deJ
 l2Vujvjxarrmed2AD4YyL1OX5+/KTGHuIbwRxD+i6kvujNjmz6jWfOpbgTYzlj1BSJs4TrD
 g7EZ5QlVT9P7KGCA10kVQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Pe9by1DtA3w=:BrLFsPYymMO4YsQZfY7cU2
 G449LcbAwiYSEw2OZYEQAhHvAaN/wt/H/WO5iIO8T9rwr3aR+cEMcHiGqq0ylJcme4/1z8xfk
 Kx/MRKY+NSVJifC3Sxw4edXPKOhIZiqa8MLMmk/pUDNHzF3yWhXW1Qa2ici6bDAhikXWGEWg+
 9yrcTOsQiE4dzlOAzweD8/R4bRvS2ImE8PaCs/Y5Rd7rnlrAO61o543siQC0QqDMy1NSo9Y0w
 tHeSKgHy7u97QKvASW0XfEB6DECbGgmGhA3rXv+AXzjyn8PznIhFe4mbXkt2APLaVAB2xSPoR
 mzDNRBOUSHqJdwlM67CJihJzEBMiXqSbIZC1bLEGxy6ODNk2sYh77qY5xijncleZ5Zfnjjluc
 xZLWOXBqOWli7AKu+ICedVAJIzL0zaSA5BltJo7ALhM3BmK8T6UhiY2y5qUDoy/Z9fMfoBJ/R
 rC6wXPWzPflaPdvpElAlNs2Aof3naOE5vPBkWZ+RscJ7Pglm9RxxFdfmXg2XPpKTxxux3lW0V
 msaFfDJwmd+dwnPNxVM6xemjENWc0iuVDhJUEA7b5Hsr6QEVNceqgW8UtGhrKoLLGLQ4hIcjb
 TTfzn5oZRTnICDilPqdvABsjN1cVP6Wu3ch/LkwHBof9iKREBkFWx7KReM9gif4f33U6MOnxX
 Tu8VvaJavHr5ozt77aYTYsm9hKwz0jjZpCUIuM+bK0SLBauS+eMa47Mza7bCsJoWvNovA+OQo
 aPdTUMaSTThXe15jJBC0uUhXhEVawUzSwYb221KTHm2M8wWAMFYsj+FwMwGExrQC4ROMrVTv3
 m/cIcVpWcT4v62tkpRWuXzxbNpTE2UDxgLHVXI7qm6mJqH2VKFQA+y/QU3CPMGV+9lU3ITHQ2
 cHTXUWfJf1nY2vEHNKmpC2jtrmTgtjkgCjo8s0+clhPL/hFzToYOk2aCLZxkv98gxz+dB4tNs
 90NwAMBRl5RORzuwYoITjSBiebcpLCN0raeVwXPkvrrLEl0FO6/hneXv/OKC4gEA++G6skkVf
 kxQFin34N7jCMJ4didzSDOW2KH7DXZazU+VpAXFYvm3XUzqw0cvojAUym7n2GWMdKC+QIGXDb
 B9zooIX4bq2xVduHjm0FhXmfraJSdEJzzjQUCkCuOC5kzbODxt48FPE3WXDjEZGBap+1a73J/
 PAsGmjmetUkn8SHGa2FJ9Y2aCAn+XH5ls152ag/nT7U5csb/6wjk+BHZz65cwtUVcKxeQ=
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

This kexec patch series is the groundwork for kexec on the parisc architec=
ture.
Since we want kexec on parisc, I've applied it to my for-next-kexec tree [=
1],
and can push it to Linus in the next merge window through the parisc tree =
[2].

If someone has any objections, or if you prefer to take it through
a kexec or powerpc tree, please let me know.

Helge

[1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.gi=
t/log/?h=3Dfor-next-kexec
[2] https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.gi=
t/log/?h=3Dfor-next

On 23.08.19 21:49, Sven Schnelle wrote:
> Changes to v4:
>  - rebase on current powerpc/merge tree
>  - fix syscall name in commit message
>  - remove a few unused #defines in arch/powerpc/kernel/kexec_elf_64.c
>...
>  arch/Kconfig                                  |   3 +
>  arch/powerpc/Kconfig                          |   1 +
>  arch/powerpc/kernel/kexec_elf_64.c            | 545 +-----------------
>  include/linux/kexec.h                         |  23 +
>  kernel/Makefile                               |   1 +
>  .../kexec_elf_64.c =3D> kernel/kexec_elf.c      | 394 +++----------
>  6 files changed, 115 insertions(+), 852 deletions(-)
>  copy arch/powerpc/kernel/kexec_elf_64.c =3D> kernel/kexec_elf.c (50%)
