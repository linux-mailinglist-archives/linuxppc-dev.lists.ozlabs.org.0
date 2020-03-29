Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582B196DC9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 16:02:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qy2s2NMdzDqKN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 01:02:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qy0j3SHtzDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 01:00:33 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id 111so15113340oth.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 07:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QNLlN1zb7CRtDuVy5Iix3XnwCOUZPqrirtS+X+CgoVE=;
 b=r+E9lfDfLmQYMpvBaQInVGEbvkxziPAajz0wS3WWZimWcyAh5mxTaslN3rQ3sNz1mi
 1Ra4aPQlRDOerp830IvjSgUwnET+bnhGg8xsoRw0YFHyjmP3NVQOWwo5iwYxYr5zZu+Q
 rEEukK6KrI4pGyepLaIAz5bwmGB1eiJfuXoUKE7gABwwNf6KLacYkKfcBVpHi2GwP3QM
 8qLRTjV4kdqamuajMB715lzjnIBwcZO3sQjECSmPWr79O+2+DyMYsyiAPhc/MPn/TpEo
 in5mpVTTVXzOTh3Q1A9gRWd82VJix9A/Tw4UrbpWBpYjChz/eleN0IANcKTXYwN+QEWa
 BhiQ==
X-Gm-Message-State: ANhLgQ09g/aBFsk+isSd/JpUheLL1QuWQ0qvOWvTRlozqZK13Dzzs8v+
 gZchcHcaua+hiHtyn2bfqP0zJg1cMaa6H54oBuM=
X-Google-Smtp-Source: ADFU+vtZcnjvciREbPV3aE1DKklNynoYrVXM5GmbgxK/5cng9VzfaBdVb0Gmw3D+X2C3eyx9p2xCYsevdeeVYPGXK20=
X-Received: by 2002:a05:6830:15c2:: with SMTP id
 j2mr5548328otr.107.1585490431002; 
 Sun, 29 Mar 2020 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585340156.git.geoff@infradead.org>
 <e0dc92ba82a993c845f8d2bf3ace7465ef5ea996.1585340156.git.geoff@infradead.org>
In-Reply-To: <e0dc92ba82a993c845f8d2bf3ace7465ef5ea996.1585340156.git.geoff@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 29 Mar 2020 16:00:20 +0200
Message-ID: <CAMuHMdU1qLs1u3JuJM+r4jV0gGQuq4B11gbSDsX6JHUBFQAX3w@mail.gmail.com>
Subject: Re: [PATCH 7/9] powerpc/ps3: Add check for otheros image size
To: Geoff Levand <geoff@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Emmanuel Nicolet <emmanuel.nicolet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geoff,

On Fri, Mar 27, 2020 at 9:26 PM Geoff Levand <geoff@infradead.org> wrote:
> The ps3's otheros flash loader has a size limit of 16 MiB for the
> uncompressed image.  If that limit will be reached output the
> flash image file as 'otheros-too-big.bld'.
>
> Signed-off-by: Geoff Levand <geoff@infradead.org>

Thanks for your patch!

> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -570,7 +570,16 @@ ps3)
>          count=$overlay_size bs=1
>
>      odir="$(dirname "$ofile.bin")"
> -    rm -f "$odir/otheros.bld"
> -    gzip -n --force -9 --stdout "$ofile.bin" > "$odir/otheros.bld"
> +
> +    # The ps3's flash loader has a size limit of 16 MiB for the uncompressed
> +    # image.  If a compressed image that exceeded this limit is written to
> +    # flash the loader will decompress that image until the 16 MiB limit is
> +    # reached, then enter the system reset vector of the partially decompressed
> +    # image.  No warning is issued.
> +    rm -f "$odir"/{otheros,otheros-too-big}.bld
> +    size=$(${CROSS}nm --no-sort --radix=d "$ofile" | egrep ' _end$' | cut -d' ' -f1)
> +    bld="otheros.bld"
> +    [ $size -le 16777216 ] || bld="otheros-too-big.bld"
> +    gzip -n --force -9 --stdout "$ofile.bin" > "$odir/$bld"
>      ;;
>  esac

Why not print an error message and exit 1 instead, like is done for
other fatal errors?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
