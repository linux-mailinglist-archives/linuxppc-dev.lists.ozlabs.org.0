Return-Path: <linuxppc-dev+bounces-1227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C166D97476F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 02:39:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3MC92Jv6z2yVb;
	Wed, 11 Sep 2024 10:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726015157;
	cv=none; b=O6ADrs7hMakkUGxnVi4Zx7bDoyPPThjyRjM/vD3BBB6eedgPDIF+KBTiX6/k4Mg07nm+lxNlWuYwNgG93jcz6vMDgZmHYvG2rZc9FTYq821AvnSu9TqIu2ZgvNFgPM0XHH5aMtouxQPkN0SWC1FlZLKMzfCLKD37EQA7YM9Z7QO3geTyQgyMIbbU6VHr0o94RXvhpfpfTNEgryMfwf+RrrSdfv3JERe1uO3hTxYLdewYTXtyD8bp5Aq5nkg2pNWdS/PbcekgL1jBbt06RCBusONduWU+a/iMvJMnc5GFSZ2BTDRTRUhBA8xmjH/0dvs98cxc4AQOJd0XcoOmQRPpGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726015157; c=relaxed/relaxed;
	bh=aU2W8CjkecEHnTcSi2eLdxjM7yES0Dfnh45fYE5GR5I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Uy2kVTfghddwdADvkF8APyC9iML7XFIjLU02FWedwcfKzHX6WCSxb2XB3l/S/JQMP2ItbnqZcs89bJHt91Q8uZx5hQBhP3J7wQ1OKjb8zJy648dAfhzH1IkwbPh1sL7w0d0p6tiOTdnP7M30DdGoYr9IyYwLq4Hx3wEN2AAlNE/uDpL++Nid2kFW7AtBRTMgJf5pXSuowtFuVl/zKntwwKBFaWT4q9opGSyeKFAp5tSsV2nfXV8pNi9P7+uhUrn+osP/AeJKhsejnIyGSLPDRDSIBBTRTJUvwzJXU8T+Us1sj7s/3dO1Mu9eF3whTptXWfNeH09s8a5eiEw+24PpUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NRVsKBlL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NRVsKBlL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3MC85ppJz2yVD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 10:39:15 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71788bfe60eso1030903b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726015152; x=1726619952; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aU2W8CjkecEHnTcSi2eLdxjM7yES0Dfnh45fYE5GR5I=;
        b=NRVsKBlLe3WvDA3YSpOsB10zA8IeKSkgOcl23UFkrsC78pW3v8Ox6XkjRp+GuC3pRe
         3T3IXlQc5CloUacg0gJRJm8570JWz8aasX/xKyccwNWPyzgM4NNmNkuv/6WsbTrPwlwm
         DSEJIJndB6CN3QwtruEAcu1YTskcF+64rsZ/rJRohVU0ztU+rkN+N2YP2x8nd1vJu7D/
         Bo7FnAp0ikCkvXCUltlBkynNidEw5huNCVXkxCMTLXgpxULyomi6Wx0pfSDTwVZS5mOC
         TZ72fru7gqV9EupWUELgeoXBDfZFvciLChA3MZ4QE3dQ351P5XWEnkfh4Yc3sPKVZv8a
         8+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726015152; x=1726619952;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aU2W8CjkecEHnTcSi2eLdxjM7yES0Dfnh45fYE5GR5I=;
        b=VvFVJbnquUNuzAlOuhcAX7uuV31ikryLnfJUgm+2KsEqdJh3RLkkEAOVcgLvr7TkRk
         vD/R+6jHoXHXU0aFE8QgCKbuvttleUtNkgUT9vBfbUXexHkYMxHLzaaFRuqipIRSpcqB
         LvAR+KXcXwAg2hCY28cjokatM6MuQUNpPb+pklfAOpLj1lBCQtZAEZH+4onWHkinNglu
         e/9QDmGpxnoHg5VqsjMyAkCmxVm/ohwE5TqigKD4CnnIP6UHIqjTqC4zYPDJlOyvq0xc
         jeQ2ThDUHXyogJghpIUwYtzarGE1q7VAwX2J6Bn87i6cDb+1G3Koeo05Fo0lB3+6KH0g
         H4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWPJGUsJZczo2HfEyuZwDGaBiGyAJifQQ8RTvLmnuE4yyYldG9Sh+zV+5mWZ3x9Nhf8zeea+JM4+QmYAbM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyWsBRKMaRYPphGvBsYcZM6oMnd1HFZ/LlEuPfaMT01zwJUfpqR
	VxTS2L5jurd0hmv24T0dbneQmJUF3vL6Y9t9YcY9QCQ1chejeCTI
X-Google-Smtp-Source: AGHT+IHRKKq+mrn5RGMG8qqoe7SoGI6xTYPwCUO1y//ca3K0M+pW44jdvdBPQb4Ae3YMIwaUEIB4lw==
X-Received: by 2002:a05:6a00:21cd:b0:714:1bce:913a with SMTP id d2e1a72fcca58-7191712345fmr1713499b3a.21.1726015152432;
        Tue, 10 Sep 2024 17:39:12 -0700 (PDT)
Received: from localhost ([1.146.47.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-719090b038bsm1909998b3a.152.2024.09.10.17.39.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 17:39:12 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 10:39:03 +1000
Message-Id: <D431AYECDJV3.1AVQCTIRV2J4G@gmail.com>
Cc: <pbonzini@redhat.com>, <thuth@redhat.com>, <lvivier@redhat.com>,
 <frankja@linux.ibm.com>, <imbrenda@linux.ibm.com>, <nrb@linux.ibm.com>,
 <atishp@rivosinc.com>, <cade.richard@berkeley.edu>, <jamestiotio@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] configure: Introduce add-config
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, <kvmarm@lists.linux.dev>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-s390@vger.kernel.org>
X-Mailer: aerc 0.18.2
References: <20240903143946.834864-4-andrew.jones@linux.dev>
 <20240903143946.834864-5-andrew.jones@linux.dev>
In-Reply-To: <20240903143946.834864-5-andrew.jones@linux.dev>

On Wed Sep 4, 2024 at 12:39 AM AEST, Andrew Jones wrote:
> Allow users to add additional CONFIG_* and override defaults
> by concatenating a given file with #define's and #undef's to
> lib/config.h

That's a horrible config format lol, but probbaly the simplest way to
get something working. What if you included the user config first, then
make the generated config test ifndef before defining the default?

Is it better to have a config file than to just add more --options to
configure? If we had thousands of options maybe, but so far we are
getting by with configure options. I think I prefer that for now
unless we wholesale moved everything to a .config style.

Thanks,
Nick

>
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>  configure | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/configure b/configure
> index 27ae9cc89657..7a1317d0650d 100755
> --- a/configure
> +++ b/configure
> @@ -64,6 +64,8 @@ usage() {
>  	                           no environ is provided by the user (enabled =
by default)
>  	    --erratatxt=3DFILE       specify a file to use instead of errata.tx=
t. Use
>  	                           '--erratatxt=3D' to ensure no file is used.
> +	    --add-config=3DFILE      specify a file containing configs (CONFIG_=
*) to add on to the
> +	                           generated lib/config.h. Use #undef to overri=
de default configs.
>  	    --host-key-document=3DHOST_KEY_DOCUMENT
>  	                           Specify the machine-specific host-key docume=
nt for creating
>  	                           a PVM image with 'genprotimg' (s390x only)
> @@ -153,6 +155,10 @@ while [[ "$1" =3D -* ]]; do
>  	    erratatxt=3D
>  	    [ "$arg" ] && erratatxt=3D$(eval realpath "$arg")
>  	    ;;
> +	--add-config)
> +	    add_config=3D
> +	    [ "$arg" ] && add_config=3D$(eval realpath "$arg")
> +	    ;;
>  	--host-key-document)
>  	    host_key_document=3D"$arg"
>  	    ;;
> @@ -213,6 +219,10 @@ if [ "$erratatxt" ] && [ ! -f "$erratatxt" ]; then
>      echo "erratatxt: $erratatxt does not exist or is not a regular file"
>      exit 1
>  fi
> +if [ "$add_config" ] && [ ! -f "$add_config" ]; then
> +    echo "add-config: $add_config does not exist or is not a regular fil=
e"
> +    exit 1
> +fi
> =20
>  arch_name=3D$arch
>  [ "$arch" =3D "aarch64" ] && arch=3D"arm64"
> @@ -502,4 +512,8 @@ cat <<EOF >> lib/config.h
> =20
>  EOF
>  fi
> +if [ "$add_config" ]; then
> +    echo "/* Additional configs from $add_config */" >> lib/config.h
> +    cat "$add_config" >> lib/config.h
> +fi
>  echo "#endif" >> lib/config.h


