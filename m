Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C831895F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 07:42:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j0pB30w9zDqpq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 17:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=FtR2PsJj; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j0mQ6nPtzDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 17:40:54 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id x7so13124497pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 23:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=XzGu2D0qbUiQXlYIBSsYZEbEbHXflKv2iEThfbgwGOA=;
 b=FtR2PsJjhjhKf5THRO1zaSBNSWnNScL3wmfKecLJuGLphjWSBVrpyhEaqdSCNdSvUQ
 9FrvdstZbxCKwoBww4uyXL3VL1qbVUFSpIw7QtI0+oTebzcUk4pXZyjSFF5ZBCT1lOcw
 Qa5HTtUFLY9yhYArROexRhc0SxHUYghz9Km4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=XzGu2D0qbUiQXlYIBSsYZEbEbHXflKv2iEThfbgwGOA=;
 b=WRHvQbxSMw9rGBs39W7RUARK1oc85r/UAyhhEVCR7ysxmGBWuaxOkuEUcgUhw4f2ZN
 FN5b1RJvijnEy2OcPIsBEB5vGk2RBco8myzPH0Y5a/byUJ34aVc9K0kEfX+CFnyqdoOB
 kQ3l44IdKR6T9wiQX9n++efz41O5bd2NlAOFcvL48itl7Whu0Jpo67oZulWrFliXhyX0
 jou2tkXb0aVXz1Oo/nLRT01X72tOB5TmwcpYwztAhkVf0ElcDKedG/4WRKTh/De9YYdV
 VuXv2/ZebP2NdVYET/qxKO+JpFa8Jl2J9syPGqMeIMYPYNaeohpmrzWLfZEAX4MF4CLQ
 PyVg==
X-Gm-Message-State: ANhLgQ38zjBGgxYY2sp3YjT20lz2Ym0rNy94IZ3q4D5/wz+ytXQZYm8b
 JJS6TiZIfVt6m5XertmUlfNqsg==
X-Google-Smtp-Source: ADFU+vuuLgtMuWos5RSXth1TDFodBLLeGr0ujcN7Kxgun0iHFMriORUyvEX61Ty5qRi6xy2iWUvIrQ==
X-Received: by 2002:aa7:95a1:: with SMTP id a1mr2834620pfk.279.1584513650717; 
 Tue, 17 Mar 2020 23:40:50 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-11e1-e7cb-3c10-05d6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:11e1:e7cb:3c10:5d6])
 by smtp.gmail.com with ESMTPSA id t8sm1244142pjy.11.2020.03.17.23.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 23:40:49 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 5/5] selftests/powerpc: Add README for GZIP engine tests
In-Reply-To: <20200316180714.18631-6-rzinsly@linux.ibm.com>
References: <20200316180714.18631-1-rzinsly@linux.ibm.com>
 <20200316180714.18631-6-rzinsly@linux.ibm.com>
Date: Wed, 18 Mar 2020 17:40:46 +1100
Message-ID: <874kumnp1t.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: abali@us.ibm.com, haren@linux.ibm.com, herbert@gondor.apana.org.au,
 Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a good readme, the instructions for compiling and testing work.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

Raphael Moreira Zinsly <rzinsly@linux.ibm.com> writes:

> Include a README file with the instructions to use the
> testcases at selftests/powerpc/nx-gzip.
>
> Signed-off-by: Bulent Abali <abali@us.ibm.com>
> Signed-off-by: Raphael Moreira Zinsly <rzinsly@linux.ibm.com>
> ---
>  .../powerpc/nx-gzip/99-nx-gzip.rules          |  1 +
>  .../testing/selftests/powerpc/nx-gzip/README  | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
>  create mode 100644 tools/testing/selftests/powerpc/nx-gzip/README
>
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules b/tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
> new file mode 100644
> index 000000000000..5a7118495cb3
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/99-nx-gzip.rules
> @@ -0,0 +1 @@
> +SUBSYSTEM=="nxgzip", KERNEL=="nx-gzip", MODE="0666"
> diff --git a/tools/testing/selftests/powerpc/nx-gzip/README b/tools/testing/selftests/powerpc/nx-gzip/README
> new file mode 100644
> index 000000000000..ff0c817a65c5
> --- /dev/null
> +++ b/tools/testing/selftests/powerpc/nx-gzip/README
> @@ -0,0 +1,44 @@
> +Test the nx-gzip function:
> +=========================
> +
> +Verify that following device exists:
> +  /dev/crypto/nx-gzip
> +If you get a permission error run as sudo or set the device permissions:
> +   sudo chmod go+rw /dev/crypto/nx-gzip
> +However, chmod may not survive across boots. You may create a udev file such
> +as:
> +   /etc/udev/rules.d/99-nx-gzip.rules
> +
> +
> +Then make and run:
> +$ make
> +gcc -O3 -I./inc -o gzfht_test gzfht_test.c gzip_vas.c
> +gcc -O3 -I./inc -o gunz_test gunz_test.c gzip_vas.c
> +
> +
> +Compress any file using Fixed Huffman mode. Output will have a .nx.gz suffix:
> +$ ./gzfht_test gzip_vas.c
> +file gzip_vas.c read, 5276 bytes
> +compressed 5276 to 2564 bytes total, crc32 checksum = b937a37d
> +
> +
> +Uncompress the previous output. Output will have a .nx.gunzip suffix:
> +$ ./gunz_test gzip_vas.c.nx.gz
> +gzHeader FLG 0
> +00 00 00 00 04 03
> +gzHeader MTIME, XFL, OS ignored
> +computed checksum b937a37d isize 0000149c
> +stored   checksum b937a37d isize 0000149c
> +decomp is complete: fclose
> +
> +
> +Compare two files:
> +$ sha1sum gzip_vas.c.nx.gz.nx.gunzip gzip_vas.c
> +f041cd8581e8d920f79f6ce7f65411be5d026c2a  gzip_vas.c.nx.gz.nx.gunzip
> +f041cd8581e8d920f79f6ce7f65411be5d026c2a  gzip_vas.c
> +
> +
> +Note that the code here are intended for testing the nx-gzip hardware function.
> +They are not intended for demonstrating performance or compression ratio.
> +For more information and source code consider using:
> +https://github.com/libnxz/power-gzip
> -- 
> 2.21.0
