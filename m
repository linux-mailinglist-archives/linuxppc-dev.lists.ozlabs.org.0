Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93378CD57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 22:10:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fjasle.eu header.i=@fjasle.eu header.a=rsa-sha256 header.s=mail header.b=TZjNabJF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZz7v4p6vz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Aug 2023 06:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fjasle.eu (client-ip=212.227.126.134; helo=mout.kundenserver.de; envelope-from=nicolas@fjasle.eu; receiver=lists.ozlabs.org)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZz5n3JXTz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Aug 2023 06:08:51 +1000 (AEST)
Received: from leknes.fjasle.eu ([46.142.49.30]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1My2lr-1plB1Y2Khr-00zZZb; Tue, 29 Aug 2023 22:07:23 +0200
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 1A2013E768; Tue, 29 Aug 2023 22:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1693339640; bh=l+HLj7y9TY6hnwNLh5Tvgor5q1S2kg+NBhBTFWf7BDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TZjNabJFSEjakaf8YUJrtigZNKhmAm/vXSk/OlmIWUMQpA+H/yNDSs0zMiyYamtp7
	 tbZpqHv09gSqIzJk39c3HaMBGk+KKsV6TrkHj/EVF4TvbbXnVepzgpINm7goS0E79Q
	 MD4EH+3oEaVdp1z7tYdc9/aj5vf+42HKlJWQmjBU=
Date: Tue, 29 Aug 2023 22:07:19 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2 0/2] kbuild: Show Kconfig fragments in "help"
Message-ID: <ZO5P9597qqm3P+li@fjasle.eu>
References: <20230825194329.gonna.911-kees@kernel.org>
 <CAK7LNATcTw+btQVri7SBA8gFbDNMYz7D2gMQaoZp9sQGFjCw8Q@mail.gmail.com>
 <87ttsjlmho.fsf@mail.lhotse>
 <ZO2NVLipjlzIh0YS@bergen.fjasle.eu>
 <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jAIN7/hQsTcrQJVA"
Content-Disposition: inline
In-Reply-To: <CAK7LNARjsB+LTBGRfWX68Ld7oehhuBv9SY8scoC=Xk8EJc-OHw@mail.gmail.com>
X-Provags-ID: V03:K1:H6j0VbafbOwtymffj5vqJ5spHUNhWSXsYRHmYahDmlcdTnCoTSZ
 Y5deAqJtEaYxv+Zf/xYkwayr4y4RNjk3w2RNVWySOnUPB/x0mu0L/JGvGPQfzXd3wHiwRcN
 YOMrA0qs7TWDwkPnZ+kORWHa27x5NXqsgFcQ2DBLwt4XYH7sv7LWUW+BfDZKHog98GfWyCc
 M1HtNk4/feeh4gsXKAj9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2XmiLl1yasM=;KMTTmfRVTN212bF2Kt9kaQMqZPF
 Z11wTERV8WQrNQIAM7JfN6QVLW3Y3+21p3yj291tqy5lYprc7M5ElxVCe3B+EQvoHW3VpYEFH
 Dve6VnlQi0KTr+uuHojU23IR8nHEfLZAioXZEMdzBjiWAu8bl7Nr2WpCKHuUjszUjIEMxiaes
 bFlR2MDadDjlaVu0Nwyo6hkdmO03N3wVxl/Qt7HbvClEY6m0YVo5KBWt0oJK9/iw3et5hiO8m
 Vk+J1PFL1/bgavr7czMo+4UREiWiuKIgdA8k8U4ffo4FGhMzIgwZYFG8CLh5jg0dKqB/XH3ni
 8e//ASYixKBApJwhiaUiA/dCvaew9CbsGfWhlATWR1gejyEhRssXssBlDlkWq2UP6sXn7VgXe
 Tzq+AekXaGOyZqsOR8LEKz2ElluoerReXmr9mgTFn1P/IDJ5tMpAPSzc9g88yaPH6GAtYag6Y
 m+NgEYUJ6WHRh7MHBNk3PRAKNk/EjMKadhva+pvLfUzEeAhBeCr/xabJmu9n0M2uxCZcWJ82B
 mQYO5q5PayoS1zds0k5MVYSZWokWPyTciQspklfBO8AdwRGqqtBYlO+nI9LIIjKBsEiQioyLp
 P0IMOBkuSmpQrF7sCGqtOyi3QpM11ER6D0oj97ocIugmQkt7aHvKIkEX1jZnFwaEtqgX5a2LB
 iW3dKg0t9/yZeSitA3NXEd1MasnC4h+kV4lU6RjS/9Zr8n4FFGQU6+iomPQHF4eismdl9WYls
 sdd0TgL9ktwPLczl12QcTzM63FAqIkXgMiw8VS+7hpMsTfKi6If8BptgO81HZ5Kfsm0ZfHhn+
 bwA8ulEILIJRQrci5TBcg4MRZl5zshn7s1LIx+0H8wI15Zg8jXNllPt/EZHiM2ulMb/P+Zxxb
 ZKGlFDlYzQFc9Vg==
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--jAIN7/hQsTcrQJVA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 11:57:19PM +0900 Masahiro Yamada wrote:
> On Tue, Aug 29, 2023 at 3:55=E2=80=AFPM Nicolas Schier <nicolas@fjasle.eu=
> wrote:
> >
> > On Mon 28 Aug 2023 16:17:07 GMT, Michael Ellerman wrote:
> > > Masahiro Yamada <masahiroy@kernel.org> writes:
> > > > On Sat, Aug 26, 2023 at 4:55=E2=80=AFAM Kees Cook <keescook@chromiu=
m.org> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> This is my series to show *.config targets in the "help" target so=
 these
> > > >> various topics can be more easily discoverd.
> > > >>
> > > >> v2:
> > > >>  - split .fragment from .config to hide "internal" fragments
> > > >
> > > > Please do not do this churn.
> > >
> > > That was my idea :}
> > >
> > > > Like Randy, I did not get "why" part quiet well,
> > > > but if you are eager about this,
> > > > you can show help message only when the following
> > > > ("# Help:" prefix for example) is found in the first line.
> > > >
> > > > # Help: blah blah
> > > > # other comment
> > >
> > > I did think of that, but wasn't sure how to do it in make.
> >
> > Something like this should do it:
> >
> >         @grep -Hnm1 -e '^# Help:' $(foreach f, $(sort $(notdir $(call c=
onfigfiles,*.config))), $(firstword $(call configfiles,$(f)))) | \
> >          while read loc dummy helptext; do \
> >                 tmp=3D"$${loc%:#}"; file=3D"$${tmp%:*}"; line=3D"$${tmp=
##*:}"; \
> >                 [ "$${line}" =3D "1" ] && \
> >                   printf "  %-25s - %s\\n" "$${file##*/}" "$${helptext}=
"; \
> >          done
> >
> > but this neither beautiful nor elegant it likes to be improved.
> >
> > Kind regards,
> > Nicolas
>=20
>=20
>=20
>=20
> The attached patch will work too.
>=20
> I dropped the "in the first line" restriction
> because SPDX might be placed in the first line
> of config fragments.
>=20
>=20
>=20
> --=20
> Best Regards
> Masahiro Yamada

> diff --git a/Makefile b/Makefile
> index e21bf66af6fd..23cd62a5ff05 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1552,7 +1552,6 @@ help:
>  	@echo  '  mrproper	  - Remove all generated files + config + various ba=
ckup files'
>  	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
>  	@echo  ''
> -	@echo  'Configuration targets:'
>  	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
>  	@echo  ''
>  	@echo  'Other generic targets:'
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index fdc2e3abd615..c4b2a8a19fc8 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -335,9 +335,5 @@ define archhelp
>    echo  '			  bzdisk/fdimage*/hdimage/isoimage also accept:'
>    echo  '			  FDARGS=3D"..."  arguments for the booted kernel'
>    echo  '			  FDINITRD=3Dfile initrd for the booted kernel'
> -  echo  ''
> -  echo  '  kvm_guest.config	- Enable Kconfig items for running this kern=
el as a KVM guest'
> -  echo  '  xen.config		- Enable Kconfig items for running this kernel as=
 a Xen guest'
> -  echo  '  x86_debug.config	- Enable tip tree debugging options for test=
ing'
> =20
>  endef
> diff --git a/kernel/configs/kvm_guest.config b/kernel/configs/kvm_guest.c=
onfig
> index 208481d91090..d0877063d925 100644
> --- a/kernel/configs/kvm_guest.config
> +++ b/kernel/configs/kvm_guest.config
> @@ -1,3 +1,4 @@
> +# Help: Bootable as a KVM guest
>  CONFIG_NET=3Dy
>  CONFIG_NET_CORE=3Dy
>  CONFIG_NETDEVICES=3Dy
> diff --git a/kernel/configs/x86_debug.config b/kernel/configs/x86_debug.c=
onfig
> index 6fac5b405334..35f48671b8d5 100644
> --- a/kernel/configs/x86_debug.config
> +++ b/kernel/configs/x86_debug.config
> @@ -1,3 +1,4 @@
> +# Help: Debugging options for tip tree testing
>  CONFIG_X86_DEBUG_FPU=3Dy
>  CONFIG_LOCK_STAT=3Dy
>  CONFIG_DEBUG_VM=3Dy
> diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
> index 436f806aa1ed..6878b9a49be8 100644
> --- a/kernel/configs/xen.config
> +++ b/kernel/configs/xen.config
> @@ -1,3 +1,5 @@
> +# Help: Bootable as a Xen guest
> +#
>  # global stuff - these enable us to allow some
>  # of the not so generic stuff below for xen
>  CONFIG_PARAVIRT=3Dy
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index af1c96198f49..e72c5ee659a9 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -93,11 +93,13 @@ endif
>  %_defconfig: $(obj)/conf
>  	$(Q)$< $(silent) --defconfig=3Darch/$(SRCARCH)/configs/$@ $(Kconfig)
> =20
> -configfiles=3D$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(=
SRCARCH)/configs/$@)
> +configfiles =3D $(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arc=
h/$(SRCARCH)/configs/$(1))
> +all-config-fragments =3D $(call configfiles,*)
> +config-fragments =3D $(call configfiles,$@)
> =20
>  %.config: $(obj)/conf
> -	$(if $(call configfiles),, $(error No configuration exists for this tar=
get on this architecture))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .conf=
ig $(configfiles)
> +	$(if $(config-fragments),, $(error $@ fragment does not exists on this =
architecture))
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .conf=
ig $(config-fragments)
>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> =20
>  PHONY +=3D tinyconfig
> @@ -115,6 +117,7 @@ clean-files +=3D tests/.cache
> =20
>  # Help text used by make help
>  help:
> +	@echo  'Configuration targets:'
>  	@echo  '  config	  - Update current config utilising a line-oriented pr=
ogram'
>  	@echo  '  nconfig         - Update current config utilising a ncurses m=
enu based program'
>  	@echo  '  menuconfig	  - Update current config utilising a menu based p=
rogram'
> @@ -141,6 +144,12 @@ help:
>  	@echo  '                    default value without prompting'
>  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
>  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and p=
ytest)'
> +	@echo  ''
> +	@echo  'Configuration topic targets:'
> +	@$(foreach f, $(all-config-fragments), \
> +		if help=3D$$(grep -m1 '^# Help: ' $(f)); then \
> +			printf '  %-25s - %s\n' '$(notdir $(f))' "$${help#*: }"; \
> +		fi;)

thanks, this looks much better, and SPDX is a good point.

Kind regards,
Nicolas

--jAIN7/hQsTcrQJVA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmTuT/cACgkQB1IKcBYm
EmlEpBAA7EkWGNiEhiWIxoOzhdqdsKaNQxgOjYbqO/5twfQCF8a28YvjT5rz5+4c
zPaZ2m/zhowV0qsT8Ic7f6+g1ScrV4kyFmwDnsPy4nq/Kv+idjqKxp9fvrznAO9A
4y3NL0GVRWYkfk50CSIU9QfxpArZdpfTmFI/C8hO4mxUnDWTkApYhaMo1arXxPaU
eegk3YDPFW4C7jkOeZm+RNrx8WVCbFEshzKPUt1av0RcSwieZcSL3DiHMqYMapWj
ydkoxuaC6R6L4nlZv0oLwLbSmIDqy4qVMscsEkREwROezN2+f0pJUnjELIFVpTbQ
JSE9vEYdKdM362Fk1ehON8QZF4tY6Z9gz5tQ+61zutDCa3/ZZxSAzBdz16vYjPtn
LzX4D+g1vbJUhQSmtsmnTVwnIf9X/TMGLVrKte+iB+wso642TqIdJCpI7Yn6th7h
9ni2QcqIyCgkvoSX4T/2WYdCeipITjBRaMtP9pRo6ORQZN9D0WYakVoSXCgv2P0e
WEWpp88brXiio9h66oXrxKexHqNuCnLB43eKBWIvNVN+5JoJJk8PBD66X66i53/u
7MHJb/vaStGawuOLeic+YJ0qM4mKtHqwd7rdU+HE8BedURnxdQdKCtiSu7n6Kc+g
gA7K076mUUemwOYxKPSTsu2NHn+iUKuziiqc47dT/pOS+cql8TY=
=Fe5h
-----END PGP SIGNATURE-----

--jAIN7/hQsTcrQJVA--
