Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7066A8FC113
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 03:04:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cM+7ftkE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vv8Py4LZdz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 11:04:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cM+7ftkE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vv8PF4lFMz3cRJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2024 11:04:16 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-681ad26f4a5so3652504a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 18:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717549454; x=1718154254; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oyj+P5t43pKHTJuKnYG7NhQQXfP08lprT6P4Es8XJ2Q=;
        b=cM+7ftkEbwaAP2uKNu0JJglm44dLayQX6JZOTUAser0iN8qEAn8mZZSlK20QbwkQkr
         8M4cG7i78TOB9BftLzQE/iFp0QIx7U3itUouUGM01xKnk9fbqQkP4LvWMbKsw3scSrgm
         PY/7VGcaekl2SK0s4eEOLUuJB8tcAvF+O+Z4I7vYp79dHRu4A5wmqWZ342va3zDtP8EO
         mLQcWuhnr06IT50kasuSziELBh5relL3CTAszfbYe5huhv6jK6k7GBu1U3LsgbfyMOnI
         TO2grULF+2PJmF3DLU1dLhQk/YYa1DKDQ2WAFcd/w719lBJZQSFTe2dOu4/KY8dibBQe
         5MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717549454; x=1718154254;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oyj+P5t43pKHTJuKnYG7NhQQXfP08lprT6P4Es8XJ2Q=;
        b=DFg3CC6s5+MQrJNBYbGCtC6UUfD9Tdb09KmHsj+26LbicfM4hEMM6EftIyHMSsplim
         U8ygT0sJTxnPlTwue8rpGuQccURwBzv0+5088Zgt1oBK2gB40QO+fm0w6Wdb1m/svVYj
         ubEtKyrq8eKZbikB7Rb9crjLKFNXFPlWDx8+9xLjswRCrQhmx5SDm6tkiRJxtDlXoyDb
         ciP1V1TB6KAsxZJjUWZhJ+ufxFNJCIxVPLE3vzsnHBffbGm0aTzVTrt2yYdoyHKgLuk+
         yzEIvh9ECcQXOMVHa0uxv10S2UnzoCBuWkE4b/x5xmT2/Wy6V5uWugESDBM2/SxHZQyh
         3L2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnTU0aydlFdbJ/h071NRTFmYtVscviamhd0QFB3mqFmpNWts0VHcI2j9xyARrh1jmjkXupAEvdl2ryDbqBUKRypGs2AkW/gMAe6+cJAg==
X-Gm-Message-State: AOJu0YyEH735AteG/06lsLl28/we9HuRf96Nda6aBAK+APm905F9Mat8
	/19n+Y8J6RZN0xYLaWoRKCV3lYsLnrj20w8rJ59X9AU1JC/bRNG10k1BxQ==
X-Google-Smtp-Source: AGHT+IECq50jUUORKiDYMBjG95N98XIMKvb/xSRYaPvjPOBa00vc8Dgc78oKWMk2nlEI301hfIKVbw==
X-Received: by 2002:a05:6a21:196:b0:1b1:ed9d:f92e with SMTP id adf61e73a8af0-1b2b70eeae8mr1537879637.38.1717549454405;
        Tue, 04 Jun 2024 18:04:14 -0700 (PDT)
Received: from localhost (110-175-65-7.tpgi.com.au. [110.175.65.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242c2448fsm7622992b3a.192.2024.06.04.18.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 18:04:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Jun 2024 11:04:09 +1000
Message-Id: <D1ROGSFOPWVG.P6EV7DR1DIT2@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 21/31] powerpc: Add timebase tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-22-npiggin@gmail.com>
 <014763b7-93d9-4725-acc0-b5436a5ea91a@redhat.com>
In-Reply-To: <014763b7-93d9-4725-acc0-b5436a5ea91a@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Jun 4, 2024 at 4:12 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > This has a known failure on QEMU TCG machines where the decrementer
> > interrupt is not lowered when the DEC wraps from -ve to +ve.
>
> Would it then make sense to mark the test with accel =3D kvm to avoid the=
 test=20
> failure when running with TCG?

Still want to test it with TCG though, which had quite a few bugs I
used these tests to fix. It is marked as known fail for TCG (once the
later host accel patch is merged).

> > +/* Check amount of CPUs nodes that have the TM flag */
> > +static int find_dec_bits(void)
> > +{
> > +	int ret;
> > +
> > +	ret =3D dt_for_each_cpu_node(cpu_dec_bits, NULL);
>
> What sense does it make to run this for each CPU node if the cpu_dec_bits=
=20
> function always overwrites the global dec_bits variable?
> Wouldn't it be sufficient to run this for the first node only? Or should =
the=20
> cpu_dec_bits function maybe check that all nodes have the same value?

Yeah it could use first subnode.

> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	return dec_bits;
> > +}
> > +
> > +
> > +static bool do_migrate =3D false;
> > +static volatile bool got_interrupt;
> > +static volatile struct pt_regs recorded_regs;
> > +
> > +static uint64_t dec_max;
> > +static uint64_t dec_min;
> > +
> > +static void test_tb(int argc, char **argv)
> > +{
> > +	uint64_t tb;
> > +
> > +	tb =3D get_tb();
> > +	if (do_migrate)
> > +		migrate();
> > +	report(get_tb() >=3D tb, "timebase is incrementing");
>
> If you use >=3D for testing, it could also mean that the TB stays at the =
same=20
> value, so "timebase is incrementing" sounds misleading. Maybe rather=20
> "timebase is not decreasing" ? Or wait a little bit, then check with ">" =
only ?

Yeah, maybe first immediate test could ensure it doesn't go
backward, then wait a bit and check it increments.

> > +}
> > +
> > +static void dec_stop_handler(struct pt_regs *regs, void *data)
> > +{
> > +	mtspr(SPR_DEC, dec_max);
> > +}
> > +
> > +static void dec_handler(struct pt_regs *regs, void *data)
> > +{
> > +	got_interrupt =3D true;
> > +	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
> > +	regs->msr &=3D ~MSR_EE;
> > +}
> > +
> > +static void test_dec(int argc, char **argv)
> > +{
> > +	uint64_t tb1, tb2, dec;
> > +	int i;
> > +
> > +	handle_exception(0x900, &dec_handler, NULL);
> > +
> > +	for (i =3D 0; i < 100; i++) {
> > +		tb1 =3D get_tb();
> > +		mtspr(SPR_DEC, dec_max);
> > +		dec =3D mfspr(SPR_DEC);
> > +		tb2 =3D get_tb();
> > +		if (tb2 - tb1 < dec_max - dec)
> > +			break;
> > +	}
> > +	/* POWER CPUs can have a slight (few ticks) variation here */
> > +	report_kfail(true, tb2 - tb1 >=3D dec_max - dec, "decrementer remains=
 within TB after mtDEC");
> > +
> > +	tb1 =3D get_tb();
> > +	mtspr(SPR_DEC, dec_max);
> > +	mdelay(1000);
> > +	dec =3D mfspr(SPR_DEC);
> > +	tb2 =3D get_tb();
> > +	report(tb2 - tb1 >=3D dec_max - dec, "decrementer remains within TB a=
fter 1s");
> > +
> > +	mtspr(SPR_DEC, dec_max);
> > +	local_irq_enable();
> > +	local_irq_disable();
> > +	if (mfspr(SPR_DEC) <=3D dec_max) {
> > +		report(!got_interrupt, "no interrupt on decrementer positive");
> > +	}
> > +	got_interrupt =3D false;
> > +
> > +	mtspr(SPR_DEC, 1);
> > +	mdelay(100); /* Give the timer a chance to run */
> > +	if (do_migrate)
> > +		migrate();
> > +	local_irq_enable();
> > +	local_irq_disable();
> > +	report(got_interrupt, "interrupt on decrementer underflow");
> > +	got_interrupt =3D false;
> > +
> > +	if (do_migrate)
> > +		migrate();
> > +	local_irq_enable();
> > +	local_irq_disable();
> > +	report(got_interrupt, "interrupt on decrementer still underflown");
> > +	got_interrupt =3D false;
> > +
> > +	mtspr(SPR_DEC, 0);
> > +	mdelay(100); /* Give the timer a chance to run */
> > +	if (do_migrate)
> > +		migrate();
> > +	local_irq_enable();
> > +	local_irq_disable();
> > +	report(got_interrupt, "DEC deal with set to 0");
> > +	got_interrupt =3D false;
> > +
> > +	/* Test for level-triggered decrementer */
> > +	mtspr(SPR_DEC, -1ULL);
> > +	if (do_migrate)
> > +		migrate();
> > +	local_irq_enable();
> > +	local_irq_disable();
> > +	report(got_interrupt, "interrupt on decrementer write MSB");
> > +	got_interrupt =3D false;
> > +
> > +	mtspr(SPR_DEC, dec_max);
> > +	local_irq_enable();
> > +	if (do_migrate)
> > +		migrate();
> > +	mtspr(SPR_DEC, -1);
> > +	local_irq_disable();
> > +	report(got_interrupt, "interrupt on decrementer write MSB with irqs o=
n");
> > +	got_interrupt =3D false;
> > +
> > +	mtspr(SPR_DEC, dec_min + 1);
> > +	mdelay(100);
> > +	local_irq_enable();
> > +	local_irq_disable();
> > +	/* TCG does not model this correctly */
> > +	report_kfail(true, !got_interrupt, "no interrupt after wrap to positi=
ve");
> > +	got_interrupt =3D false;
> > +
> > +	handle_exception(0x900, NULL, NULL);
> > +}
> > +
> > +static void test_hdec(int argc, char **argv)
> > +{
> > +	uint64_t tb1, tb2, hdec;
> > +
> > +	if (!machine_is_powernv()) {
> > +		report_skip("skipping on !powernv machine");
>
> I'd rather say "not running on powernv machine"

Okay.

Thanks,
Nick
