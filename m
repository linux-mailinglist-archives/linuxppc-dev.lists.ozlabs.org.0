Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5221D13D0B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 00:41:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ykPL2Lm9zDqRw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 10:41:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ykLw6MMqzDq9B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 10:39:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=B5o0Q+Qb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47ykLs4sxMz9sR1;
 Thu, 16 Jan 2020 10:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1579131575;
 bh=bM+tz2kFdbTfR+m35IrApP9n+YHuTQq0hXIrBD1g6p0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=B5o0Q+Qbz+Fh9nE6jGV8mxlgxUvMrP7QnMN7U8rJQtga5PK4LN11cKBT/wLOLs4YP
 XuuAQ+Bsk3h7dQ/zO7fab/eJr7Cxr4uhtJBmsVRPA+PgjEJ/yxN53hXroCdOuOKYOI
 G7bcHeM5X2XLDhiLYdnIe0Axc0SBLxrU0i7U4WOHBcmlZY0kXD0cH0eJ+Lv/Y2HtlN
 qnJ8Vu/9spGH3FAwSo+F+6zs/eA2zf+UOzdgE8mt36GSlxCcpJs1KMdLt98Flz6JRN
 soQ0lm8kiGof8G9XlKjoX8QxuJzgqqnC47fhhJTpIaLHyzovjA8fUUdGyoLkFITU1E
 nE9c9dUXrF6Hw==
Date: Thu, 16 Jan 2020 10:39:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] powerpc: Do not consider weak unresolved symbol
 relocations as bad
Message-ID: <20200116103932.2e603cf9@canb.auug.org.au>
In-Reply-To: <20200115204648.7179-1-alex@ghiti.fr>
References: <20200115204648.7179-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/X0ES/Pzabz50rIWcgod6J4G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/X0ES/Pzabz50rIWcgod6J4G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Thanks for sorting this out.  Just a few comments below.

On Wed, 15 Jan 2020 15:46:48 -0500 Alexandre Ghiti <alex@ghiti.fr> wrote:
>

> =20
>  # Have Kbuild supply the path to objdump so we handle cross compilation.
                                            ^
"and nm"

> +# Remove from the bad relocations those that match an undefined weak sym=
bol
> +# which will result in an absolute relocation to 0.
> +# Weak unresolved symbols are of that form in nm output:
> +# "                  w _binary__btf_vmlinux_bin_end"
> +undef_weak_symbols=3D$($nm "$vmlinux" | awk -e '$1 ~ /w/ { print $2 }')
> +
> +while IFS=3D read -r weak_symbol; do
> +	bad_relocs=3D"$(echo -n "$bad_relocs" | sed "/$weak_symbol/d")"
> +done <<< "$undef_weak_symbols"

This is not a bash script, and the above is a bashism :-(
Also, my version of awk (mawk) doesn't have a -e option.

How about something like :

undef_weak_symbols=3D$($nm "$vmlinux" | awk '$1 ~ /w/ { print $2 }')
if [ "$undef_weak_symbols" ]; then
	bad_relocs=3D"$(echo "$bad_relocs" | grep -F -w -v "$undef_weak_symbols")"
fi

Or do this near the top and add the grep to the others.
--=20
Cheers,
Stephen Rothwell

--Sig_/X0ES/Pzabz50rIWcgod6J4G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4forQACgkQAVBC80lX
0GyunwgAkZoBTpQAhgoODm6QrksXXQEyfUW4a4mYnW8Q62gQraQoNVv0H9M1Irnu
1W7s/FfgvSNAom/ST78bdY0mPdADH0TZmyyRJbv2EIYvnwUdXva5UwAboMLCacnW
PZKeC8ox9F57/Td+tDK7okuk/uO17KKp+Uo70DeDeS2i8KUZyUJxD+mO7y173pUj
hNt25ESQEqrC4Lvu9I16kyLjxvjzMRv4unaQIy3htYQCbxF7/X1Lu33FEhvAJ9vx
4BY7VWCaE2KNUMEaupSvJiXKfKWWGw6uMNZysIM17C5CfdHZvhaeMNYjNq03A6tX
jalLi/Ycc9raelW8W8CmcuHx5CzvDA==
=q+Te
-----END PGP SIGNATURE-----

--Sig_/X0ES/Pzabz50rIWcgod6J4G--
