Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1F427DA3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 23:38:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1CSK5JdDzDqJl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Sep 2020 07:38:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=94.100.187.222; helo=fallback23.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=inbox.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail header.b=O0gShlYE; 
 dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=EVvtcjCG; dkim-atps=neutral
X-Greylist: delayed 3399 seconds by postgrey-1.36 at bilbo;
 Wed, 30 Sep 2020 00:08:33 AEST
Received: from fallback23.mail.ru (fallback23.m.smailru.net [94.100.187.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C11Sx15B1zDqWP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Sep 2020 00:08:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=6RSxY738ACpF+Ino9SWbcQaQGlKofTJn7oumjFW5fzQ=; 
 b=O0gShlYECDL+4ylfDc3t8Xb7A4cvQJkdbhnJ8zVkQmdpzgWnX7wxedlgfpl3qxn8JflTTXi6dF9I1dHY3YiPgHOytcA51x5TVZxGfLbxQpsD51n2KtxgtYHWIgw/HseZ8KOlQk/eWrcCTAwBGN/KvCh9GRadbfh95ui+iwjjIWU=;
Received: from [10.161.25.38] (port=52190 helo=smtp61.i.mail.ru)
 by fallback23.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1kNFPy-0002JK-Mw; Tue, 29 Sep 2020 16:11:43 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=6RSxY738ACpF+Ino9SWbcQaQGlKofTJn7oumjFW5fzQ=; 
 b=EVvtcjCG6iG0MRH8VznkQUDbusbVCMgyb98pKRrUiNHZFLxpji7qlsAMCvjBEe9s9/W/EARvx+qBDcYaWZoqVNH1zNqYZY7tXILI70LKoFc+rV7xFqTTji5W3xRz4asfoKYlkwxyK+oO+p9jgxiGnSsEQlEmcMVOU4cA6b1D08A=;
Received: by smtp61.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1kNFPg-0001yn-6c; Tue, 29 Sep 2020 16:11:24 +0300
Subject: Re: [PATCH v2 devicetree 0/2] Add Seville Ethernet switch to T1040RDB
To: Vladimir Oltean <vladimir.oltean@nxp.com>, robh+dt@kernel.org,
 shawnguo@kernel.org, mpe@ellerman.id.au, devicetree@vger.kernel.org
References: <20200929113209.3767787-1-vladimir.oltean@nxp.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <5e3155b5-5fc1-387a-9721-02a2b7b9cf4e@inbox.ru>
Date: Tue, 29 Sep 2020 16:11:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200929113209.3767787-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9943D5126A2FD5EE2E4744A35E03BDE7E88A2F725AC4993DD182A05F538085040E00759E436B1AE8B00F915B731C3D5B5EFF1BEFEFC18FF7FDBC6893C7533B864
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE782A779A89F7D69B2C2099A533E45F2D0395957E7521B51C2CFCAF695D4D8E9FCEA1F7E6F0F101C6778DA827A17800CE7DECE8D0A5E25C0FCEA1F7E6F0F101C674E70A05D1297E1BBC6CDE5D1141D2B1CA653A634B32B94ECB68811EB7CA856A18F8A64FDE1EEBEBE9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BB23A54CFFDBC96A8389733CBF5DBD5E9D5E8D9A59859A8B68424CA1AAF98A6958941B15DA834481F9449624AB7ADAF372AE38A8E97BAFFB1D8FC6C240DEA76428AA50765F79006374B5E63B45CF01F35D81D268191BDAD3DBD4B6F7A4D31EC0B7A15B7713DBEF166D81D268191BDAD3D78DA827A17800CE75FBA0EF8B1D2889EEC76A7562686271E8729DE7A884B61D135872C767BF85DA29E625A9149C048EE0A3850AC1BE2E7352686C055BC15B7FB4AD6D5ED66289B524E70A05D1297E1BB35872C767BF85DA227C277FBC8AE2E8B80B9CEB5436E71E375ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57C2F2A386D11C4599BD9CCCA9EDD067B1EDA766A37F9254B7
X-C8649E89: C9FAD1E4A4F7ECA36AADBFC215A6348C82396AFA045BE753B9041556026F05AF288F6AE2636E4FD6
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj50aJSQv4UNby20YYs+zVBg==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24928DA749C2ED0FF3FD4E7ECC4866820231FC2BFA7FE3EA0CEE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: EEAE043A70213CC8
X-77F55803: 6242723A09DB00B4DAC42D0CFF71F59E1485FCD7B475D8D787079C09ED9F4FF368F3CF0E9FE49B69332DF44F249B4C8D935375F240E155F4699919774D6B3F81A78295C7688E7FE6
X-7FA49CB5: 0D63561A33F958A5EE1B9F76EDE2F3692C72DEB705C7C3BAC603FC59B98070898941B15DA834481FA18204E546F3947C6FF1B927F95F3316F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8BAA867293B0326636D2E47CDBA5A96583CDB5D6C1DA9E2EA8302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7044D3B264367893ED32BA5DBAC0009BE395957E7521B51C20B4866841D68ED3567F23339F89546C55F5C1EE8F4F765FC80B9CEB5436E71E375ECD9A6C639B01BBD4B6F7A4D31EC0BC0CAF46E325F83A522CA9DD8327EE4930A3850AC1BE2E7352686C055BC15B7FBC4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F8DB212830C5B42F72623479134186CDE6BA297DBC24807EABDAD6C7F3747799A
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj50aJSQv4UNZUBTMZe2p1tQ==
X-Mailru-MI: 800
X-Mailru-Sender: A5480F10D64C9005EA165EA48716E380811A351EE4D290472FA911C9A7E4EC6DC8217CE68A9CF838C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-Mailman-Approved-At: Wed, 30 Sep 2020 07:26:45 +1000
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
Cc: madalin.bucur@oss.nxp.com, linux-kernel@vger.kernel.org,
 radu-andrei.bulie@nxp.com, paulus@samba.org, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>

29.09.2020 14:32, Vladimir Oltean пишет:
> Seville is a DSA switch that is embedded inside the T1040 SoC, and
> supported by the mscc_seville DSA driver inside drivers/net/dsa/ocelot.
> 
> This series adds this switch to the SoC's dtsi files and to the T1040RDB
> board file.
> 
> Vladimir Oltean (2):
>    powerpc: dts: t1040: add bindings for Seville Ethernet switch
>    powerpc: dts: t1040rdb: add ports for Seville Ethernet switch
> 
>   arch/powerpc/boot/dts/fsl/t1040rdb.dts      | 115 ++++++++++++++++++++
>   arch/powerpc/boot/dts/fsl/t1040si-post.dtsi |  76 +++++++++++++
>   2 files changed, 191 insertions(+)
> 
