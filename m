Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7431A3E22AA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 06:36:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ggt2y1cTlz3dCC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 14:36:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=UFEXCZSI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256 header.s=mail3 header.b=GdcLTRmh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inbox.ru (client-ip=185.5.136.252; helo=fallback20.mail.ru;
 envelope-from=fido_max@inbox.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail3 header.b=UFEXCZSI; 
 dkim=pass (1024-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail3 header.b=GdcLTRmh; 
 dkim-atps=neutral
Received: from fallback20.mail.ru (fallback20.mail.ru [185.5.136.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ggt2R3B5Bz3bnK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 14:35:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=H5hpDoobmu6noWGVwtiiQgnuU9d2+5UcbTTbqT69ezs=; 
 t=1628224543;x=1628829943; 
 b=UFEXCZSIxDWqGT7AY0yKO8QjY9I+SuPBfYGsEdx0i1FvVTp6FmbaP8sT3/++nns1hckNUzRk9cCpWaZbW+fF+zYFEXAReRYiiDCasEJbiAj2nPt+IEjll0hSAPeG81tyuvXxRPo2iWPvggl9xCal2LOhvdteVH5oBIxgIdOXBvk=;
Received: from [10.161.64.39] (port=46820 helo=smtp31.i.mail.ru)
 by fallback20.m.smailru.net with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1mBra5-0001jQ-Fd; Fri, 06 Aug 2021 07:35:37 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail3; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=H5hpDoobmu6noWGVwtiiQgnuU9d2+5UcbTTbqT69ezs=; 
 t=1628224537;x=1628829937; 
 b=GdcLTRmhZux+BqHjLqMArFd5Zsu7T52lz85PDwPQjSgd9AnluLGb4iLaYIx14Ha0kCt4UuRN8HviMXz5Rcke/dXaXJei4sLDIpXR1kPeWx1X0S/YgtGY+FW4A5KZZy7yu8MCvygVOb2iMIy4te5+DGFvA7U2EvbOEv1Zgcg/axI=;
Received: by smtp31.i.mail.ru with esmtpa (envelope-from <fido_max@inbox.ru>)
 id 1mBrZw-0000jU-MN; Fri, 06 Aug 2021 07:35:29 +0300
Subject: Re: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
 platform_device
To: Saravana Kannan <saravanak@google.com>
References: <20210803113538.560277-1-fido_max@inbox.ru>
 <CAGETcx8QC+AMXvmk4RB=LGp00QLVVX4uCeeruAjFnGq_irMh4Q@mail.gmail.com>
From: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <dff603dc-9038-71cb-bfcb-5abc24f17109@inbox.ru>
Date: Fri, 6 Aug 2021 07:37:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAGETcx8QC+AMXvmk4RB=LGp00QLVVX4uCeeruAjFnGq_irMh4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-4EC0790: 10
X-7564579A: B8F34718100C35BD
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD94BB7C0677F3ED9D05EB08EAFC9298EA6182A05F538085040424FDF1F140CA04FC58E9E3E940473E3B417BDE81A4354C9CCA9DD50DEBA4881
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D77100FFB2844417EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637F28F4AF03526AA8F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D82DC01B880DF1D20C937FADCBE42F17C66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7B857F55CE090FEC39FA2833FD35BB23D9E625A9149C048EE9ECD01F8117BC8BEA471835C12D1D9774AD6D5ED66289B52BA9C0B312567BB23117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FCA7254B381AF727C63AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637177033D41FBFE4A8D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F83C798A30B85E16BA91E23F1B6B78B78B5C8C57E37DE458BEDA766A37F9254B7
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458F0AFF96BAACF4158235E5A14AD4A4A4625E192CAD1D9E79D94463893BF8742D060F91D1CA0DBFEE1
X-C1DE0DAB: 0D63561A33F958A535E8308DECFB38B8D7076D3B86F44C0256AC019E27C5727ED59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75BF6B963DD989C0FC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D342B8615F5CFAD9D02FA5FE3EF0CC7A1B209A39C1CE9422835D0A5866E4242BAB762C16E02EBE50F0C1D7E09C32AA3244CB3A411169EEECC7E3DE5540041A38E4469B6CAE0477E908D27AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojFhlvmGwdUwS32l63QGN20g==
X-Mailru-Sender: 11C2EC085EDE56FA9C10FA2967F5AB24EBB174A6A3B148F4B47D0DDBFECE33849F04B3BAF9552DA1EE9242D420CFEBFD3DDE9B364B0DF2891A624F84B2C74EDA4239CF2AF0A6D4F80DA7A0AF5A3A8387
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4EE34287C01580B6070D21CCF350081A4B28449CA49A5441668F3CF0E9FE49B695C609E9F26DC0F053448FA89FF667CA4F5BC946DBE4C52B6F3BF51963B26E6AD
X-7FA49CB5: 0D63561A33F958A5D1A5013007419D0FD3C604509D8D1EF9D42AA1D2E744948BCACD7DF95DA8FC8BD5E8D9A59859A8B6828616D4398AA993CC7F00164DA146DAFE8445B8C89999728AA50765F790063706C2E049600DA66E9FA2833FD35BB23D2EF20D2F80756B5F868A13BD56FB6657A471835C12D1D977725E5C173C3A84C36804EF05EF4ADF2ACC7F00164DA146DA6F5DAA56C3B73B237318B6A418E8EAB8D32BA5DBAC0009BE9E8FC8737B5C2249B0754FDCBEC41BF076E601842F6C81A12EF20D2F80756B5F7E9C4E3C761E06A7089D37D7C0E48F6C8AA50765F79006376A91CFDE938F542CEFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505EB5C1D2BA53C1C806246B31C8BC6C2BB
X-C1DE0DAB: 0D63561A33F958A5D1A5013007419D0FD3C604509D8D1EF98B9FBBE5A4B11F17D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojFhlvmGwdUwQbE7g1h7f7Cg==
X-Mailru-MI: 1000000000800
X-Mailru-Sender: A5480F10D64C90052AA1787BB8100F83F88861B7F0F3F6CF083ECF65916F396E9069C3D0B25B82A9C099ADC76E806A99D50E20E2BC48EF5A30D242760C51EA9CEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
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
Cc: kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

03.08.2021 20:51, Saravana Kannan wrote:
>> So lets convert this driver to simple platform_device with probe().
>> Also use platform_get_ and devm_ family function to get/allocate
>> resources and drop unused .compatible = "qeic".
> Yes, please!

Should I totally drop { .type = "qeic"}, or keep?
