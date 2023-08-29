Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C091978C3CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 14:09:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=ffsJ3MQ8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZmSk0JwRz30hM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 22:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=ffsJ3MQ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fjasle.eu (client-ip=212.227.126.135; helo=mout.kundenserver.de; envelope-from=nicolas@fjasle.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 358 seconds by postgrey-1.37 at boromir; Tue, 29 Aug 2023 22:08:00 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZmQm6PCKz306t
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 22:07:55 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.49.30]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MkYLW-1pq5zH3E2I-00m0fB; Tue, 29 Aug 2023 14:00:53 +0200
Received: from localhost.fjasle.eu (kirkenes.fjasle.eu [10.10.0.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by leknes.fjasle.eu (Postfix) with ESMTPS id B404A3E765;
	Tue, 29 Aug 2023 14:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1693310449; bh=ZYytDiGRtJSdBQgTEmMBwbn3QofSWiZ6ieqprmah5Uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ffsJ3MQ8pAHMow6/ENcXbRcDdGSihyosWQDA5tlOgKxvbSXfYpSudpK1G1LEtMCuV
	 evYZC2zandRUROQbSi+jgRSCJmZzY1gQJUd9RpCAMySZIqz0cnAM/RNyTRH+Cr+ODd
	 YmUrnlxgVrN//By7tRhDHqxKzKMzSrDAl5sr76KI=
Received: by localhost.fjasle.eu (Postfix, from userid 1000)
	id 4D130433B; Tue, 29 Aug 2023 14:00:44 +0200 (CEST)
Date: Tue, 29 Aug 2023 14:00:44 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: single-quote the format string of printf
Message-ID: <ZO3d7DrfKfsDXqa5@bergen.fjasle.eu>
References: <20230829113531.4004730-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cAtYkVZMdyBhLJxT"
Content-Disposition: inline
In-Reply-To: <20230829113531.4004730-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux trixie/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:1kGvKTysRflt5ERGARXsCw59oUWS6Z+SXXhoCC1zva1P0lEHIhP
 X3McxEspQpumtwU8c3a0ZxOJF797lVpGBI0bhVkoeXLBnU3gFBs95YfQjzFPA0r58im1oOK
 9tFyaksh9/Gk4baHZxgujmPSWvDE0cz0+Aj90PQMDaQAkqjCG1AkZOW9EMjE/S8uCue3kA4
 mpXVl4Ae0cOFpkFoTMt8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YzUUf0VGtEg=;hl7lSOQwtnBX1ATq3DbDdgSBewt
 QPxGdpvjyWzsFxArq+3IqSm35RLDfEnUChcITMgY9IseANqKUhJ7a9+fQaws/ieBrQVD2yN9u
 MzejcS6T6L0pvjBpNHZxQdgFB1BcIIWWeSxMyxhNbSzRJGXIDskR4Qm8EZsUKE+XqTqFBxDZy
 v4wg9BNVEgrJSY42pU3ZKxf0NMgAJLSQ76TXlurIxM0Fa4CQWYpzEXivon8+S/vhaAh0wp4uy
 G8TOBWXlRnXb0zs5K8qdq4Q2tYBNFJwq6/kBO+hK7NYi4F5gDY60KmCzziO05lv0QjqVqRQ6a
 KAtSmjblvFbuSrotojCgUEuPqYh81vFvKKdc01Qj56f/e1fkebFsnSUL2lbVSFBDnde/fXDNz
 qxY9Sj/zviR+wF+aO7w5IugmQ21hVMQYKimBoKIdC/7tRIvPBDJLapPIr1LwrxPZ/1EU3bkkz
 7p5GHiH6Yd7puHac6j49w80F8L9WrkEJQtsNRzDaL2wJSoI97M+u5A9rHSmuB+1fqGXWacq0W
 T2cXJ8w6RkJ+4L18UbvgsEme6wPT1iEGdoZr4kQuJrDbL8cfOxV1haEnyUqlvWWCng4Waz1YV
 qKf5SHexL6R9llcILreTsvqpaJj/MMjU7XXZmmn/ipYRXeYyg+NwcWP0ijvhhIvoUFykUjKTC
 ozc8AY14Ii10sSp0gxXNOg3vut+u6suNE3dtCsQ3dHxY7cQIFa5LEUb1hxbUW6jejcK/Fx4Ws
 RSo6XmyKvKeHe7C8QzbBuAU5eroKNi8bg05ms5Tymu8SErgr13zRsF1OuelJkgSTDj4OmwPC7
 zB2UL7l+aDitXXDZ06CtNDxWTiprCyIhrOQDsmuDqMmmVqqnt0QmvpV5rcrwhq9Sdvaa7wXBD
 6bbm22LYp2bf+fA==
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
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cAtYkVZMdyBhLJxT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 29 Aug 2023 20:35:31 GMT, Masahiro Yamada wrote:
> Use single-quotes to avoid escape sequences (\\n).
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Is this really necessary?  Testing w/ GNU Make 4.3, bash 5.2.15 or
dash 0.5.12-6 and a stupid Makefile snippet I cannot see any difference=20
between these three:

print:
	@printf "hello med single-backslash and double quotes\n"
	@printf 'hello med single-backslash and single quotes\n'
	@printf "hello med double-backslash and double quotes\\n"

Only double-backslash+n in single-quotes does not work, for obvious=20
reasons.

Is this some compatibility to older make versions or other shells?

Iff it is, we should have several cases that are actually broken right=20
now:

$ git grep -Hrne 'printf.*".*\\n' '**/Makefile*' '**/Kbuild*'=20
arch/mips/Makefile:480:   printf "  %-24s - Build generic kernel for $(call=
 describe_generic_defconfig,$(cfg))\n" $(cfg);)
arch/mips/Makefile:486:   printf "  %-24s - Build $($(cfg)-y)\n" $(cfg);)
samples/bpf/Makefile:238:HDR_PROBE :=3D $(shell printf "$(pound)include <li=
nux/types.h>\n struct list_head { int a; }; int main() { return 0; }" | \
samples/hid/Makefile:76:HDR_PROBE :=3D $(shell printf "$(pound)include <lin=
ux/types.h>\n struct list_head { int a; }; int main() { return 0; }" | \
scripts/Makefile.compiler:41:   printf "%b\n" "$(1)" | $(CC) -Werror $(CLAN=
G_FLAGS) $(KBUILD_AFLAGS) -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
scripts/Makefile.lib:437:printf "%08x\n" $$dec_size |                      =
                     \
scripts/Makefile.modfinal:43:           printf "Skipping BTF generation for=
 %s due to unavailability of vmlinux\n" $@ 1>&2; \
scripts/Makefile.modfinal:45:           printf "Skipping BTF generation for=
 %s because it's a Rust module\n" $@ 1>&2; \
security/tomoyo/Makefile:11:    printf '\t"";\n';) \
tools/testing/selftests/Makefile:263:           [ ! -d $(INSTALL_PATH)/$$TA=
RGET ] && printf "Skipping non-existent dir: $$TARGET\n" && continue; \
tools/testing/selftests/Makefile:264:           printf "Emit Tests for $$TA=
RGET\n"; \
tools/testing/selftests/nolibc/Makefile:136:             if (s+f > 0) print=
f(" See all results in %s\n", ARGV[1]); else print; }' \
tools/testing/selftests/nolibc/Makefile:155:             if (s+f > 0) print=
f(" See all results in %s\n", ARGV[1]); else print; }' \
tools/testing/selftests/nolibc/Makefile:163:             if (s+f > 0) print=
f(" See all results in %s\n", ARGV[1]); else print; }' \
tools/testing/selftests/wireguard/qemu/Makefile:335:    printf 'CONFIG_NR_C=
PUS=3D$(NR_CPUS)\nCONFIG_INITRAMFS_SOURCE=3D"$(BUILD_PATH)/init-cpio-spec.t=
xt"\n' >> $(KERNEL_BUILD_PATH)/minimal.config

I assume, that changing '\\n' occurrences in all Makefiles to '\n'=20
should be enough; but only a cosmetic change.  Or did I miss some
point?

Kind regards,
Nicolas


>=20
>  Makefile              | 8 ++++----
>  arch/powerpc/Makefile | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 87a9eef3fb4b..d09600f7a036 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1643,12 +1643,12 @@ help:
>  	@echo  ''
>  	@$(if $(boards), \
>  		$(foreach b, $(boards), \
> -		printf "  %-27s - Build for %s\\n" $(b) $(subst _defconfig,,$(b));) \
> +		printf '  %-27s - Build for %s\n' $(b) $(subst _defconfig,,$(b));) \
>  		echo '')
>  	@$(if $(board-dirs), \
>  		$(foreach b, $(board-dirs), \
> -		printf "  %-16s - Show %s-specific targets\\n" help-$(b) $(b);) \
> -		printf "  %-16s - Show all of the above\\n" help-boards; \
> +		printf '  %-16s - Show %s-specific targets\n' help-$(b) $(b);) \
> +		printf '  %-16s - Show all of the above\n' help-boards; \
>  		echo '')
> =20
>  	@echo  '  make V=3Dn   [targets] 1: verbose build'
> @@ -1684,7 +1684,7 @@ $(help-board-dirs): help-%:
>  	@echo  'Architecture specific targets ($(SRCARCH) $*):'
>  	@$(if $(boards-per-dir), \
>  		$(foreach b, $(boards-per-dir), \
> -		printf "  %-24s - Build for %s\\n" $*/$(b) $(subst _defconfig,,$(b));)=
 \
> +		printf '  %-24s - Build for %s\n' $*/$(b) $(subst _defconfig,,$(b));) \
>  		echo '')
> =20
> =20
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dac7ca153886..f49ac05eae20 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -353,7 +353,7 @@ define archhelp
>    echo '  (minus the .dts extension).'
>    echo
>    $(foreach cfg,$(generated_configs),
> -    printf "  %-27s - Build for %s\\n" $(cfg) $(subst _defconfig,,$(cfg)=
);)
> +    printf '  %-27s - Build for %s\n' $(cfg) $(subst _defconfig,,$(cfg))=
;)
>  endef
> =20
>  PHONY +=3D install
> --=20
> 2.39.2

--cAtYkVZMdyBhLJxT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmTt3eIACgkQB1IKcBYm
Emna0hAArCtrpgicD8xzhVNb1OGzeFpOaXnhfny1nwN70DTlWDM9UTX1myUA8BiC
xIHFzsWglqGlWBLnKVJZ+Be15aU2w69rUcZWwKP+Vhve+2/8XTrAM/WOktNJUNSj
0y0+SuEr+ZichEH3V5Q8gv81oAvSUg2t+aqTV6aopftHYI55vkb8dYMwQr/NwE5u
OkybclmV3Rk9hY6Ri4pUf51lXbBcfLzh1ITxmei3o9jSbjrpyh9kdfj8+2i82NT4
54XkGNiKW3jc4xC3btJpAnLeQqx2O732yvwBxv9p2JWn3kXZL+rNUMMDu+UtpcLj
zZ/QKVbfBF30uDCVd28WLzT3qNmnkXrZeIEX7gJ8DHMf8j0+eLSzrtuXNEjxvSvz
vkJ++loQGAF+Yyft5XdEP+W+ayc5HKl2wiuqKWvjeH2qRiTPwTywkOC1XS5nV2wu
Me5BCRXwTl5440lqzBdWAWn6BVk/L5EUlsfXAQxAZ1qmyk46FDXG9FevkRXBGOVp
EYm6wo9mhIiw9y+/y0dAu5+9nhFDZOCfiW8dg2rlH5skFvr8tCn2Zvhq4io8He2k
JRLaz2wfyxsrGxWFBfOs6eyFVxULaMOOaUdbtfEIFCtN37OHUdPIAqiHeYpS8UVw
I3vkc3PlqtES6iD1rL4x0L3EiBBVqFgveugfsMGJlKRCdJv9JDY=
=MVoM
-----END PGP SIGNATURE-----

--cAtYkVZMdyBhLJxT--
