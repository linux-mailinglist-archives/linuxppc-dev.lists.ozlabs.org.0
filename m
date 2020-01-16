Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 679A213D5D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 09:19:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yxvB4mSTzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 19:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.148; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=XN6XchAW; dkim-atps=neutral
X-Greylist: delayed 686 seconds by postgrey-1.36 at bilbo;
 Thu, 16 Jan 2020 19:18:02 AEDT
Received: from mx01.puc.rediris.es (outbound5mad.lav.puc.rediris.es
 [130.206.19.148])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yxs66t2fzDqNb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 19:18:01 +1100 (AEDT)
Received: from mta-out03.sim.rediris.es (mta-out03.sim.rediris.es
 [130.206.24.45])
 by mx01.puc.rediris.es  with ESMTP id 00G86IPu017464-00G86IPw017464
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 16 Jan 2020 09:06:18 +0100
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPS id 6AF50303A7C9;
 Thu, 16 Jan 2020 09:06:18 +0100 (CET)
Received: from mta-out03.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPS id 5E8B4303A7CA;
 Thu, 16 Jan 2020 09:06:18 +0100 (CET)
Received: from lt-gp.iram.es (141.33.223.87.dynamic.jazztel.es [87.223.33.141])
 by mta-out03.sim.rediris.es (Postfix) with ESMTPA id E752E303A7C9;
 Thu, 16 Jan 2020 09:06:17 +0100 (CET)
Date: Thu, 16 Jan 2020 09:06:08 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: z constraint in powerpc inline assembly ?
Message-ID: <20200116080608.GA29711@lt-gp.iram.es>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=1VrLvJTd3odHAKkqKDn1jaYs+2J/RHGEsWMdzm369i0=;
 b=XN6XchAWdiUSr19OmCpCFWAWP7R2ArDoTvH3vylj0JUGseqg9NcBYELFr62jv2vUa+cCTIareEzI
 SNS+SffCLAzcTgan6puoyZlKICLT5cr1cvASl45iXuoWsBgDFHgrjs1GErgYArbW5Igz2pBIkCrT
 orXJvF8cVOsSvF3l9hvoj8XuRUH5taZz8PYMGoSl/clKKVmcSjC3/CDMFCkPyVxb4lw+Fp7y3rRw
 p7ltKxyTUMZMBi/MIKaG3njdfyBiMcHD/ch0lJVqYaspm+4ajBKwd1c2tSf7F7nQ0jp75FrsvSy9
 D4yuOMBglCYICYyRM6Uvt6VGaOFGb5tXb1cV+w==
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 07:11:36AM +0100, Christophe Leroy wrote:
> Hi Segher,
> 
> I'm trying to see if we could enhance TCP checksum calculations by splitting
> inline assembly blocks to give GCC the opportunity to mix it with other
> stuff, but I'm getting difficulties with the carry.
> 
> As far as I can read in the documentation, the z constraint represents
> '‘XER[CA]’ carry bit (part of the XER register)'

Well, the documentation is very optimisitic. From the GCC source code
(thanks for switching to git last week-end ;-)), it is clear that the
carry is not, for the time being, properly modeled. 

Right now, in the machine description, all setters and users of the carry
are in the same block of generated instructions.

For a start, all single instructions patterns that set the carry (and
do not use it) as a side effect should mention the they clobber the 
carry, otherwise inserting one between a setter and a user of the carry 
would break. This includes all arithmetic right shift (sra[wd]{,i}, 
subfic, addic{,\.} and I may have forgotten some.

If you want to future proof your code just in case, you should also add
an "xer" clobber to all instruction sequences that may modify the carry
bit. But any inline assembly that touches XER might break if GCC is
ugraded to properly model the carry bit, and a lot of code might need to
be audited.

	Gabriel

> 
> I've tried the following, but I get errors. Can you help ?
> 
> unsigned long cksum(unsigned long a, unsigned long b, unsigned long c)
> {
> 	unsigned long sum;
> 	unsigned long carry;
> 
> 	asm("addc %0, %2, %3" : "=r"(sum), "=z"(carry) : "r"(a), "r"(b));
> 	asm("adde %0, %0, %2" : "+r"(sum), "+z"(carry) : "r"(c));
> 	asm("addze %0, %0" : "+r"(sum) : "z"(carry));
> 
> 	return sum;
> }
> 
> 
> 
> csum.c: In function 'cksum':
> csum.c:6:2: error: inconsistent operand constraints in an 'asm'
>   asm("addc %0, %2, %3" : "=r"(sum), "=z"(carry) : "r"(a), "r"(b));
>   ^
> csum.c:7:2: error: inconsistent operand constraints in an 'asm'
>   asm("adde %0, %0, %2" : "+r"(sum), "+z"(carry) : "r"(c));
>   ^
> csum.c:8:2: error: inconsistent operand constraints in an 'asm'
>   asm("addze %0, %0" : "+r"(sum) : "z"(carry));
>   ^
> 
> Thanks
> Christophe
> 
