Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E478B1D21B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 00:09:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MpkV4vh1zDqkw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 08:09:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=stevens-zone.net (client-ip=212.227.126.130;
 helo=mout.kundenserver.de; envelope-from=darren@stevens-zone.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stevens-zone.net
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Mphn6CvTzDqZn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 08:08:23 +1000 (AEST)
Received: from A1K-Ubuntu.lan ([80.189.87.217]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.163]) with ESMTPA (Nemesis) id
 1MhDIw-1iw61v2Axm-00ePr7; Thu, 14 May 2020 00:08:13 +0200
From: Darren Stevens <darren@stevens-zone.net>
To: Scott Wood <oss@buserror.net>
Date: Wed, 13 May 2020 23:02:02 +0100 (BST)
Message-ID: <4fb03d6874.55cfc4a1@auth.smtp.1and1.co.uk>
In-Reply-To: <d64d04f010598ada6e7ddb3af63fee2592b3ebeb.camel@buserror.net>
References: <20200507223025.0164b95b@Cyrus.lan>
 <d64d04f010598ada6e7ddb3af63fee2592b3ebeb.camel@buserror.net>
User-Agent: YAM/2.9p1 (AmigaOS4; PPC; rv:20140418r7798)
Subject: Re: powerpc/mpc85xx: Add Cyrus P5040 device tree source
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:Jb65O9qSOs0ASSZfmqv9PwJ5+u7OfUzA6B57tNmbTANzCs9w0td
 +sNlM280t3Ih1v8+AcQAZst95swVIhhUkcbbGk6+hKZABvHiVGLrcGVHM/HG8PCpNUxubfx
 W79pZ319GdXFfqfOXoWnMlK2W8oUe6Z6cvY/62c9oORmu5T5Cvg0CX+GE405Ab006fcP8NF
 tW3wJyVhiLSE1nobKZsEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:epC6Jbm9YDk=:sdyyOrcJH017LRDTAK6s3m
 f7qDAsa2uLRk99atidfbLRVBFPi5sO35KX3mKDPnNVl6iqlCnN32NbWSzFpAotWCyHnDVfnzt
 RmDt97G2xaUQdL9x+PaHU2qvB/yS8Wvuuu9R1DFqw+l8NAk4U2Mt15y0NskWHeMNHB85MyApm
 P2VeM93bxWSwYqhVIxGUMKQNiPQo06pZCLOjEmhyL9wvEliQcCl/B9zuUs8zL4jgycCjdtYJi
 aryOCnk4v3Ef8e23LHv6Cy23gWPh0z2Xpn2mtCKczCENVJPXaU1O0w9dvFJWXi5A0uP+S/m5D
 nhdfOJpfKHIwUJbKRoJ40DUCkGs5n2gTlF5ioPCvd+gXc/vebumBefsJqtfpwUCGWDZEkLqhC
 l+ERvKvQdVTe0Eb8/TmMlgXs22ruOrM1cJHHCJ2OOwKVAgltu88Os+p59ycINpDJGVEhJ9RLj
 YgcaMRNkA77maB7P4P0R6ILbpgu40UHxPAKDpC7CRsLtmRV9MYoVABy62ctHiTHjbso2z4xwo
 CsmGzv0Yld8z5cKXPEf4o9IN+yfKtGFcPiyzIYWLrgRKVEhNDVMhB6d0koiCt3Z4vm8g9+oMR
 4MlXRkTb8ggUcu3u0uNiyXkJpkkAAPVBDD12qsPvXnGbjCp3kAlNoDpO3LBjlIbll/lsWLHiI
 x06hnV928kFvVPbWP2QYYeObMpUZyW6N1KaBjGWDfQyjVezqHVj+ZKjhWrufzPUa6MprAKaDt
 jhGvKzTBFKA2rmsOhnJSY3Uh4aNs2GATRPwE0H+sa+d+AAnr5Z7zDwDxBNylekwrO2rmWoT1U
 QnLAylA8AjRc/RaxZL4OWvDZAvOxJHD6yMQaqSic/+F8NTJDMgKlBl/KWEg7JgNBWeSht5R
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
Cc: linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Scott

On 08/05/2020, Scott Wood wrote:
> On Thu, 2020-05-07 at 22:30 +0100, Darren Stevens wrote:
>> 
>> +/include/ "p5040si-pre.dtsi"
>> +
>> +/ {
>> +    model = "varisys,CYRUS5040";
>> +    compatible = "varisys,CYRUS";
>
> Is this board 100% compatible with the Cyrus P5020 board, down to every last
> quirk, except for the SoC plugged into it?  If not, they shouldn't have the
> same compatible.  If they are, then couldn't everything in this file but the
> SoC include be moved to a dtsi shared with cyrus_p5020.dts?

It's not 100% compatible, the mdio ports map to different fman ports, but both as are 'corenet generic' boards, I added varisys,CYRUS so it would be detected in corenet_generic.c - support for the 5020 was added by Andy Flemming, I've just tried to copy what he did.

I can add another entry to the table, but do we realy want a separate entry in the table for every supported board rather than using the device tree for similar boards?

It would be nice to get these sorted, the dts files are the last bits to make these fully supported in Linux.

>> +    aliases{
>> +        ethernet0 = &enet4;
>> +        ethernet1 = &enet10;
>> +    };
>
> Space after "aliases"

Opps, will be fixed on next version

Thanks
Darren

