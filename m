Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B653AC123
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 04:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5kCM0j5yz3c4l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 12:58:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=OgZpega7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=OgZpega7; dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5kBt6lPTz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 12:58:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G5kBj4XWFz9s5R; Fri, 18 Jun 2021 12:58:21 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G5kBj3cykz9sT6; Fri, 18 Jun 2021 12:58:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623985101; bh=xBrI+k5gbJiATLruAAz5ico22CdaePVLum8OuITDZlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OgZpega77Iov/OcaX3rdjrBj+R5b9Fm3xCAx0HWFM3MhFdn8j5eN68jV7fDrCIexL
 nvpeC+Cl8ExGjlHILCaORHu3JgXmkclkLYY8GJYu/WUqFCsZr+Y6kcDYgtePxZbIB3
 O8WH+30qLM5SxUCBplsVFB4oIf/UXReGrkKerJc8uKFiIvaOJiXoz4o/WkI4mLgloS
 jTh3XPPo6xKIIjq1UKlp3lgV4LtUiiiCP1PtTqYceHXzAREEjOsa2zH1zeA6L14JoU
 uURxgF4aQurhsgGB+U0CKsQsPNzbIkalaj1IIJ7J8yRpE2vIAK8Fdov36NTYqvrCwC
 jvtLYvAuaATtQ==
Date: Fri, 18 Jun 2021 12:58:14 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 02/11] powerpc: Add Microwatt device tree
Message-ID: <YMwLxodLhu28GbJr@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMffEN3q5RlLeg4W@thinks.paulus.ozlabs.org>
 <8735thrtl3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8735thrtl3.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 17, 2021 at 02:41:28PM +1000, Michael Ellerman wrote:
> Paul Mackerras <paulus@ozlabs.org> writes:
> >
> 
> Little bit of change log never hurts :)
> 
> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> > ---
> >  arch/powerpc/boot/dts/microwatt.dts | 105 ++++++++++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> >  create mode 100644 arch/powerpc/boot/dts/microwatt.dts
> >
> > diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
> > new file mode 100644
> > index 000000000000..9b2e64da9432
> > --- /dev/null
> > +++ b/arch/powerpc/boot/dts/microwatt.dts
> > @@ -0,0 +1,105 @@
> > +/dts-v1/;
> > +
> > +/ {
> > +	#size-cells = <0x02>;
> > +	#address-cells = <0x02>;
> > +	model-name = "microwatt";
> > +	compatible = "microwatt-soc";
> > +
> > +	reserved-memory {
> > +		#size-cells = <0x02>;
> > +		#address-cells = <0x02>;
> > +		ranges;
> > +	};
> > +
> > +	memory@0 {
> > +		device_type = "memory";
> > +		reg = <0x00000000 0x00000000 0x00000000 0x10000000>;
> > +	};
> > +
> > +	cpus {
> > +		#size-cells = <0x00>;
> > +		#address-cells = <0x01>;
> > +
> > +		ibm,powerpc-cpu-features {
> > +			display-name = "Microwatt";
> > +			isa = <3000>;
> > +			device_type = "cpu-features";
> > +			compatible = "ibm,powerpc-cpu-features";
> > +
> > +			mmu-radix {
> > +				isa = <3000>;
> > +				usable-privilege = <2>;
> 
> skiboot says 6?

That's for a machine with hypervisor mode - if I make it 6 here, then
the kernel prints a message about "HV feature passed to guest" and
then another about "missing dependency" and ends up not enabling the
feature.

Note that microwatt usually has MSR[HV] = 0 (you can set it to 1 but
it doesn't do anything).  Arguably it should force it to 1 always, but
if I do that, then the kernel starts trying to execute hrfid
instructions, which microwatt doesn't have (for example in
masked_Hinterrupt).

> > +				os-support = <0x00>;
> > +			};
> > +
> > +			little-endian {
> > +				isa = <0>;
> 
> I guess you just copied that from skiboot.
> 
> The binding says it's required, but AFAICS the kernel doesn't use it.
>
> And isa = 0 mean ISA_BASE, according to the skiboot source.

I changed it to 2050 since true little-endian mode was introduced for
POWER6.

> > +		PowerPC,Microwatt@0 {
> > +			i-cache-sets = <2>;
> > +			ibm,dec-bits = <64>;
> > +			reservation-granule-size = <64>;
> 
> Never seen that one before.

It's in PAPR+ (D.6.1.4, CPU Node Properties).

> > +			clock-frequency = <100000000>;
> > +			timebase-frequency = <100000000>;
> 
> Those seem quite high?

No, 100MHz is correct.

> > +			i-tlb-sets = <1>;
> > +			ibm,ppc-interrupt-server#s = <0>;
> > +			i-cache-block-size = <64>;
> > +			d-cache-block-size = <64>;
> 
> The kernel reads those, but also hard codes 128 in places.

Interesting, because it all seems to work.  I assume the critical
thing is doing the right dcbz's.

> See L1_CACHE_BYTES.
> 
> > +			ibm,pa-features = [40 00 c2 27 00 00 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 80 00 80 00 80 00 00 00 80 00 80 00 00 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00 80 00];
> 
> Do you need that?
> 
> You shouldn't, if we've done things right with the cpu-features support.

Turns out I don't need it.

> > +			d-cache-sets = <2>;
> > +			ibm,pir = <0x3c>;
> 
> Needed?

Nope.

> > +			i-tlb-size = <64>;
> > +			cpu-version = <0x990000>;
> > +			status = "okay";
> > +			i-cache-size = <0x1000>;
> > +			ibm,processor-radix-AP-encodings = <0x0c 0xa0000010 0x20000015 0x4000001e>;
> > +			tlb-size = <0>;
> > +			tlb-sets = <0>;
> 
> Does the kernel use those? I can't find it.
> 
> > +			device_type = "cpu";
> > +			d-tlb-size = <128>;
> > +			d-tlb-sets = <2>;
> > +			reg = <0>;
> > +			general-purpose;
> > +			64-bit;
> > +			d-cache-size = <0x1000>;
> > +			ibm,chip-id = <0x00>;
> > +		};
> > +	};
> > +
> > +	chosen {
> > +		bootargs = "";
> > +		ibm,architecture-vec-5 = [19 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 40];
> 
> Do you need that?
> 
> I assume you run with MSR[HV] = 1 (you don't say anywhere), in which
> case we never look at that property.

I do need that given we're running with MSR[HV] = 0; without that the
kernel assumes HPT mode.

Paul.
