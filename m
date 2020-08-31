Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33978257170
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 03:16:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bfsj074HyzDqSx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 11:16:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NL/YyWVk; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfsgB2l0CzDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 11:14:28 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id c15so2266688plq.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 18:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=iEkN5DrwXOJlxnjsZrjs16H1dRLrcYYPk+EaJagHbD0=;
 b=NL/YyWVkzgGzpi9k3ZzyOGrSTo7tGrED5rkR8At1/MThdr/lciHSE4Bpp+oMwXBUVu
 uCCct8p+AOg5xtazdO0O1g65hiqTPHZQWuHjZIcp1/rJbdcfAuxhwgiuzrDhmLag85k/
 ug+cHpi3hZ23Nll2gQylwsVUB0EHbJh5i79JmbfNZpFXDGOel/USq4jCbrGXBsuMOcGm
 oO8A2ULpaOpZ4txaD9fwYo1iWoD1VdPa57UZkuMLEh1tvQKBHANbBXZ8JwjFS8X3gmDM
 vPBn1kPUiL9DqYM0dNftdfJHsMaqIA8zivb/PYNMKC/TyKsz0o0uabAlf7lV4kPtnlXr
 XGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iEkN5DrwXOJlxnjsZrjs16H1dRLrcYYPk+EaJagHbD0=;
 b=K7WvBGFcwV1F94iLPDFNlQSfb1yTWH3zNms5d6nCUiglSQ7aW/KRJQBvtjWzoOSsha
 3hN5bvx1O/NCPusZViBeTVG5lTZX2yOvvtlw2Aw2DCuVOYt01w4RrlU0w0oPduCUggUo
 siNUOO6nIFFadJ29tCHv0UEiH4URzohSeigk+VyESup0j5VWROWlfIN5lBHblFJthORM
 lTYs1UvFFigUGFwdCanoVZKtJay+hJ0kZvYBVLb64CvGW6Bm+T6PSY/+oDIpOO6xMLEx
 4McoqYSWY46gmBSShy4svGXayOnHLDh68yaID/hg4p5DUsl50pIZA8+PHnujhMc4UTmo
 aHAA==
X-Gm-Message-State: AOAM531k4vXSUE5FOcrl5cGjrT39UzbOY6hW/HNeycjZS6AvFxDEy8dG
 39EYQheEWJh66krBYRq44ShJQ8d0K/s=
X-Google-Smtp-Source: ABdhPJxSPxSCHHkmQ1ZrzB6EK0xBQxfZQDwkhDGAX5H3iWMV44tsVN03+/UnKkkbkK9JaUf5/+AL3A==
X-Received: by 2002:a17:90a:5216:: with SMTP id
 v22mr8418714pjh.97.1598836465361; 
 Sun, 30 Aug 2020 18:14:25 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id d131sm5507078pgc.88.2020.08.30.18.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Aug 2020 18:14:24 -0700 (PDT)
Date: Mon, 31 Aug 2020 11:14:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: KVM on POWER8 host lock up since 10d91611f426 ("powerpc/64s:
 Reimplement book3s idle code in C")
To: linuxppc-dev@lists.ozlabs.org, Michal =?iso-8859-1?q?Such=E1nek?=
 <msuchanek@suse.de>
References: <20200830201145.GA29521@kitsune.suse.cz>
In-Reply-To: <20200830201145.GA29521@kitsune.suse.cz>
MIME-Version: 1.0
Message-Id: <1598835313.5688ngko4f.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: ro@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michal Such=C3=A1nek's message of August 31, 2020 6:11 am:
> Hello,
>=20
> on POWER8 KVM hosts lock up since commit 10d91611f426 ("powerpc/64s:
> Reimplement book3s idle code in C").
>=20
> The symptom is host locking up completely after some hours of KVM
> workload with messages like
>=20
> 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 47
> 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 71
> 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 47
> 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 71
> 2020-08-30T10:51:31+00:00 obs-power8-01 kernel: KVM: couldn't grab cpu 47
>=20
> printed before the host locks up.
>=20
> The machines run sandboxed builds which is a mixed workload resulting in
> IO/single core/mutiple core load over time and there are periods of no
> activity and no VMS runnig as well. The VMs are shortlived so VM
> setup/terdown is somewhat excercised as well.
>=20
> POWER9 with the new guest entry fast path does not seem to be affected.
>=20
> Reverted the patch and the followup idle fixes on top of 5.2.14 and
> re-applied commit a3f3072db6ca ("powerpc/powernv/idle: Restore IAMR
> after idle") which gives same idle code as 5.1.16 and the kernel seems
> stable.
>=20
> Config is attached.
>=20
> I cannot easily revert this commit, especially if I want to use the same
> kernel on POWER8 and POWER9 - many of the POWER9 fixes are applicable
> only to the new idle code.
>=20
> Any idea what can be the problem?

So hwthread_state is never getting back to to HWTHREAD_IN_IDLE on
those threads. I wonder what they are doing. POWER8 doesn't have a good
NMI IPI and I don't know if it supports pdbg dumping registers from the
BMC unfortunately. Do the messages always come in pairs of CPUs?

I'm not sure where to start with reproducing, I'll have to try. How many
vCPUs in the guests? Do you have several guests running at once?

Thanks,
Nick

