Return-Path: <linuxppc-dev+bounces-13819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C91C381CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 22:54:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1zcJ3fFKz2yFs;
	Thu,  6 Nov 2025 08:54:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762379648;
	cv=none; b=gGDF5EhPhcgwHdqRx+lnNcmAq2xkrBwMAHnssnMVPpBSC9/Ogd3w6JHATJEtKkQ8cpefDAkIHj+njXtMH4vMSM360osmZT5v5U9TSiSlx8iv+asE5HMAlNhGlIczPbIT+AE+cHdSSXHwf2a0rPTcg0kY1O1QaCPG5XJs2qMXmW3NFQq1OsHYQataBVPn96cz1Ja9qNXRBbWrJgahMRWow7pgDhwBKbVvnaLlZEg4w7nBx4M828mhr+geWVw0FSmo9bc6NWgF1ME3KDwAj/U7LnBX9mbD8nN3D4s7eJuDdLqn/GM+GdGZktDVY45MflbqR4/YMII4YsxF+zXlQdMfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762379648; c=relaxed/relaxed;
	bh=3NyO7+s0Q1YlVv+39EMFftmDuskfOkHuzdOZz8YwQ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjajcRIa51nUzZCAUpQq/NpK6cMBLHKvwz7NP7nn2uBeaic4KNlj6xgX2OMnoCoQGNvxL/SgNJG+IOchdU9EtHhnUEPZSwmSQ7CoXdpZshxr6tefYNAMb7czT3gdpjbHkDNNWpEjDe6E4AUyJ4dwAKJzjvrlwg7LMeOREEO3JVENehp2j6JJdVfPZGMXwstwMagotIkCuF6yXEpUox+xUGBuFx1s3xaFfVbCTuMuLKYxzKSAWKcJth9L+wUWqkC7cCobDKMQLaVpxvmqq8ZljgUvTRzDbEHi0+6x7bpD4KLPdC947qQkLmnzWIIbE3sxDBgvr3KWmMfyJFupO1ojcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com; dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AHarrZWQ; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org) smtp.mailfrom=osandov.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=AHarrZWQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1zcH5lJqz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 08:54:07 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b62e55af64aso24834a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Nov 2025 13:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1762379645; x=1762984445; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3NyO7+s0Q1YlVv+39EMFftmDuskfOkHuzdOZz8YwQ74=;
        b=AHarrZWQHE9e4qX9u2qBaclFTTM1veq0y5X71tw0z7f3YdoLtL95CpFKj31qCYaxWG
         dmh9K13OSzZr2cNrZmuoIZld4ENWpPHLca2dhI7r4oQ7B8dpZcnc0rFQ5MvszHcEHUNO
         nMsdUsVGy1J4zHzA7MkdyJdj9KSES5hbF/7uqxCWG/3GhU8Cjz60UZDy78r1xZNRrfpu
         oPApyUigym6SJ7fSy1dDY6dK1dc/E8SJ3JF3lN4/VESvxvmloUbLg9DRlQaHMPbMPbEl
         6Xz3tP7oInOhMFvoB6HEQCgMq3w1q81Oqna2V/l3zRkDXumEcvYk3mQJcVfqbcSiA38J
         hgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762379645; x=1762984445;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NyO7+s0Q1YlVv+39EMFftmDuskfOkHuzdOZz8YwQ74=;
        b=T8FU/GcWJUhWmVBsEtocRKdtrEo8VvNCaGnmAfg/MD8M4V1xFIz5bYbkRtYB33UdO0
         UbYqVsmd7TsTTcNEP4mGlUlPC5hTlueOM6RFi7rR0N+ywNJTdgjqYwmSsShsIS3wcwDg
         SLOUmc0juiO6GaAXKvcClbHPsm12Hu/PqYPB/Xg+/ren3FSgxWg/r6QDgwtsDDDwHSaI
         fiPkLVJLuobHjYGtsj3kYiHx3GyxCZ9Sxuml/tEKmvD0v9nB12cJyLOrQOJr2JceTgkW
         2fUqXbF9AOP1ZmI19H36L5gCFkMYPJ4ynZ5noGHR19mNueGqnlSEkl0fNI+/z/nV4Jpf
         0kAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcMDxNUP5/9adDKRMiAz3xkOXthBI3EW1LpwAd1pKZkOvp97tcFxnfOzWYEO9rqNh8FJJ0DNf39oEAZl8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwQnbF0b0ThpQfA0FioYWRpB2n2FNJarNyg8DEHIYINgBTgBpR+
	xrin7/GgyrU4lPNWbkmZ2fcm02Mzlowgs6iQtsyJZQoyT3/SXJbrWFiRUUbkgoy3BaM=
X-Gm-Gg: ASbGncuBPcgeeM9lpWcSaeag/waAq6l/S2smLP9xQIMRuj3XEy64OszaL4/A9McXC+V
	b3nSwDwfnAR5s2/DKWVZ18P0eOQq1SHBhWt7BO0JEzrJ4M1axVvt2myy1GYy5veaUaDnU9P6bTI
	tMbqcKI6m5ntNi4i+CboQEQi+EPzDkf5iLuMIZzX/3PZX9oM4hAoDKYILhbc+VsGohXnGDNiUsm
	1DFJ5WbuWbdMZvN8tywv5WPENZidQuQUaCqsc/NVSioDgmieOOn5wq/RYC8xWOYW1CSZLuOWl2M
	h4sXzP0xozZb+gDWhKGJifzDHqMSMwjV5Nc3A2smoiN+CBo4fPJUktElLROmX2Tb7FHr/miUoGH
	O+7b1aaup5/csstcsD8cUZIpE5Mj7qNAfO4CtXtjs8kc7sk76d1oidlqlt9QrRuypZMutvw==
X-Google-Smtp-Source: AGHT+IGFQNfflrxSoXLFnSus/BEHD479ifwfdhVpXjNkWU1UacD8ijw1jHX3iuARmyJ9ksBMTvfybg==
X-Received: by 2002:a17:90b:1e0f:b0:341:abd4:b9f5 with SMTP id 98e67ed59e1d1-341abd4c08emr3186130a91.6.1762379645534;
        Wed, 05 Nov 2025 13:54:05 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::7:5bbb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68bf37bsm3952646a91.7.2025.11.05.13.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 13:54:03 -0800 (PST)
Date: Wed, 5 Nov 2025 13:54:02 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, dimitri.ledkov@surgut.co.uk,
	stable@vger.kernel.org, Nicolas Schier <nsc@kernel.org>,
	Alexey Gladkov <legion@kernel.org>, linux-debuggers@vger.kernel.org
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQvHehCLxrXGcH5k@telecaster>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
 <20251105005603.GA769905@ax162>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105005603.GA769905@ax162>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 05:56:03PM -0700, Nathan Chancellor wrote:
> + Nicolas and Alexey, just as an FYI.
> 
> Top of thread is:
> 
> https://lore.kernel.org/7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com/
> 
> On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> > IBM CI has also reported this error.
> > 
> > 
> > Error:
> > 
> > 
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> > prefix
> >   INSTALL /boot
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> > prefix
> > depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> > prefix
> > 
> > 
> > Git bisect is pointing to below commit as first bad commit.
> > 
> > 
> > d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> > commit d50f21091358b2b29dc06c2061106cdb0f030d03
> > Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> > Date:   Sun Oct 26 20:21:00 2025 +0000
> > 
> >     kbuild: align modinfo section for Secureboot Authenticode EDK2 compat
> 
> Thank you for the bisect. I can reproduce this with at least kmod 29.1,
> which is the version I can see failing in drgn's CI from Ubuntu Jammy
> (but I did not see it with kmod 34, which is the latest version in Arch
> Linux at the moment).
> 
> Could you and Omar verify if the following diff resolves the error for
> you? I think this would allow us to keep Dimitri's fix for the
> Authenticode EDK2 calculation (i.e., the alignment) while keeping kmod
> happy. builtin.modules.modinfo is the same after this diff as it was
> before Dimitri's change for me.
> 
> Cheers,
> Nathan
> 
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index ced4379550d7..c3f135350d7e 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -102,11 +102,23 @@ vmlinux: vmlinux.unstripped FORCE
>  # modules.builtin.modinfo
>  # ---------------------------------------------------------------------------
>  
> +# .modinfo in vmlinux is aligned to 8 bytes for compatibility with tools that
> +# expect sufficiently aligned sections but the additional NULL bytes used for
> +# padding to satisfy this requirement break certain versions of kmod with
> +#
> +#   depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname prefix
> +#
> +# Strip the trailing padding bytes after extracting the .modinfo sections to
> +# comply with what kmod expects to parse.
> +quiet_cmd_modules_builtin_modinfo = GEN     $@
> +      cmd_modules_builtin_modinfo = $(cmd_objcopy); \
> +                                    sed -i 's/\x00\+$$/\x00/g' $@
> +
>  OBJCOPYFLAGS_modules.builtin.modinfo := -j .modinfo -O binary
>  
>  targets += modules.builtin.modinfo
>  modules.builtin.modinfo: vmlinux.unstripped FORCE
> -	$(call if_changed,objcopy)
> +	$(call if_changed,modules_builtin_modinfo)
>  
>  # modules.builtin
>  # ---------------------------------------------------------------------------

Thanks for the quick fix, this worked for me on a machine with kmod
version 28.

Tested-by: Omar Sandoval <osandov@fb.com>

Thanks,
Omar

